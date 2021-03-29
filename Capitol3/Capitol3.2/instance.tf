resource "aws_key_pair" "telacad_key" {
  key_name   = "telacad_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "telacad_node" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name      = aws_key_pair.telacad_key.key_name

  provisioner "file" {
    source      = "pre-install.sh"
    destination = "/tmp/pre-install.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/pre-install.sh",
      "sudo sed -i -e 's/\r$//' /tmp/pre-install.sh",
      "sudo /tmp/pre-install.sh",
    ]
  }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.USER_INSTANTA
    private_key = file(var.CALE_CHEIE_PRIVATA)
  }
}

