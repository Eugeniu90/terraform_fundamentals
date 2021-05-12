resource "aws_instance" "telacad_node" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  
  provisioner "local-exec" {
    command = "echo ${aws_instance.telacad_node.private_ip} >> private_ips.txt"
  }
}

output "public_ip" {
  value = aws_instance.telacad_node.public_ip
}

