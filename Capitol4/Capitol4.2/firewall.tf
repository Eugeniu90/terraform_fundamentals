#######################################
# Cream un s3 bucket pentru remote state  #
#######################################

resource "aws_security_group" "europa" {
  name = "Firewall Europa"

  ingress {
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "tcp"
    cidr_blocks = slice(data.aws_ip_ranges.instante_ec2_europa.cidr_blocks, 0, 50)
  }

  egress {
    from_port = "8081"
    protocol = "tcp"
    to_port = 8081
    cidr_blocks = slice(data.aws_ip_ranges.instante_ec2_europa.cidr_blocks, 0, 50)
  }

  tags = {
    Name      = "Test"
    DataCreare = data.aws_ip_ranges.instante_ec2_europa.create_date
    SyncToken  = data.aws_ip_ranges.instante_ec2_europa.sync_token
    OptionalTagID = data.aws_ip_ranges.instante_ec2_europa.id
  }
}
