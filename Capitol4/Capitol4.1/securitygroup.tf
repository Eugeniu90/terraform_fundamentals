resource "aws_security_group" "europa" {
  name = "Firewall Europa"

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = slice(data.aws_ip_ranges.instante_ec2_europa.cidr_blocks, 0, 50)
  }
  tags = {
    DataCreare = data.aws_ip_ranges.instante_ec2_europa.create_date
    SyncToken  = data.aws_ip_ranges.instante_ec2_europa.sync_token
  }
}

