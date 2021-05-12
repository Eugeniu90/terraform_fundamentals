data "aws_subnet_ids" "all" {
  vpc_id = module.vpc.vpc_id
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "example"
  description = "Security group for example usage with EC2 instance"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
}



module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = var.name
  instance_count         = var.instance_count

  ami                    = "ami-13be557e"
  instance_type          = "t2.micro"
  monitoring             = true


  vpc_security_group_ids = [module.security_group.this_security_group_id]
  subnet_id              = tolist(data.aws_subnet_ids.all.ids)[0]


  tags = merge(
    var.tags
    )
  }