output "instance" {
  value = aws_instance.telacad_node.public_ip
}

output "rds" {
  value = aws_db_instance.mariadb.endpoint
}