resource "aws_security_group" "telacad_node" {
  vpc_id      = aws_vpc.main.id
  name        = "allow-ssh"
  description = "Permitem egress si SSH access ingress"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["188.25.166.228/32"]
  }
  tags = {
    Name = "telacad_node"
  }
}

