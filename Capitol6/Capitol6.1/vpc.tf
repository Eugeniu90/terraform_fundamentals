module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  version            = "2.59.0"
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  name               = "vpc-module-testing"
  cidr               = "10.0.0.0/16"
  azs                = ["${var.AWS_REGION}a", "${var.AWS_REGION}b", "${var.AWS_REGION}c"]
  enable_nat_gateway  = true
  single_nat_gateway  = false
  reuse_nat_ips       = true                    # <= Skip creation of EIPs for the NAT Gateways
  external_nat_ip_ids = "${aws_eip.nat.*.id}"   # <= IPs specified here as input to the module

  tags = {
    Terraform   = "true"
    Version     = "v0.14.7"
    Environment = "DEV"
  }
}

resource "aws_eip" "nat" {
  count = 3

  vpc = true
}
