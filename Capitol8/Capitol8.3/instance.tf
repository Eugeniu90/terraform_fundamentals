resource "aws_instance" "telacad_node" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # subnet-ul creat in cadrul VPC-ului
  subnet_id = aws_subnet.public-principal-1.id

  # FW la nivel de instanta
  vpc_security_group_ids = [aws_security_group.telacad_node.id]

  #  public SSH
  key_name = aws_key_pair.telacad_key.key_name

  # Atasam rolul creat la instanta noastra
  iam_instance_profile = aws_iam_instance_profile.s3-bucket-rol-profil-instanta.name

}

