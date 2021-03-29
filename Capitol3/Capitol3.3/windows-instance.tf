locals {
  init_script_masina_windows = <<EOF
<powershell>

net user ${var.INSTANCE_USERNAME} '${var.INSTANCE_PASSWORD}' /add /y
net localgroup administrators ${var.INSTANCE_USERNAME} /add

winrm quickconfig -q
winrm set winrm/config/winrs '@{MaxMemoryPerShellMB="300"}'
winrm set winrm/config '@{MaxTimeoutms="1800000"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'

netsh advfirewall firewall add rule name="WinRM 5985" protocol=TCP dir=in localport=5985 action=allow
netsh advfirewall firewall add rule name="WinRM 5986" protocol=TCP dir=in localport=5986 action=allow

net stop winrm
sc.exe config winrm start=auto
net start winrm
</powershell>
EOF
}

resource "aws_key_pair" "telacad_pub" {
  key_name   = "telacad_pub"
  public_key = file(var.LOCATIE_CHEIE_PUBLICA)
}

resource "aws_instance" "telacad_windows" {
  ami           = data.aws_ami.windows-ami.image_id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.telacad_pub.key_name
  user_data     = local.init_script_masina_windows


  provisioner "file" {
    source      = "welcome.txt"
    destination = "C:/welcome.txt"
  }
  connection {
    host     = coalesce(self.public_ip, self.private_ip)
    type     = "winrm"
    timeout  = "10m"
    user     = var.INSTANCE_USERNAME
    password = var.INSTANCE_PASSWORD
  }
}

