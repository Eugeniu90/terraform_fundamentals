resource "aws_instance" "jenkins-instance" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.small"

  subnet_id = aws_subnet.public-principal-1.id

  vpc_security_group_ids = [aws_security_group.jenkins-securitygroup.id]

  key_name = aws_key_pair.telacad_key.key_name

  user_data = data.template_cloudinit_config.cloudinit-jenkins.rendered
}

resource "aws_ebs_volume" "jenkins-disk" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"
  tags = {
    Name = "jenkins-disk"
  }
}

resource "aws_volume_attachment" "jenkins-disk-attachment" {
  device_name = var.NUME_DISC_ADITIONAL
  volume_id   = aws_ebs_volume.jenkins-disk.id
  instance_id = aws_instance.jenkins-instance.id
}

