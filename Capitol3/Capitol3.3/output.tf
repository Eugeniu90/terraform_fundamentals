output "private_ip" {

  value = aws_instance.telacad_windows.private_ip

}
output "ami_name" {

  value = aws_instance.telacad_windows.ami
}

output "arn_name" {

  value = aws_instance.telacad_windows.arn
}