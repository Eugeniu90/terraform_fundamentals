resource "aws_security_group" "ssh-on"{
  vpc_id      = aws_vpc.main.id
  name        = "ssh-ON"
  description = "SG Firewall:  SSH , egress traffic"
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
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ssh-ON"
  }
}

