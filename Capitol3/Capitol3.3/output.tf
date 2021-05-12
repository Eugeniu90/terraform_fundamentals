output "private_ip" {

  value = aws_instance.telacad_windows.public_ip
}

output "public_dns" {

  value = aws_instance.telacad_windows.public_dns
}
output "public_ip" {

  value = aws_instance.telacad_windows.public_ip
}

output "ami_name" {

  value = aws_instance.telacad_windows.ami
  sensitive = true
}

output "arn_name" {

  value = aws_instance.telacad_windows.arn

}