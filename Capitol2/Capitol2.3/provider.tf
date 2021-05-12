provider "aws" {
}

variable "AWS_REGION"{
}

variable "AMI" {

  default = {
    us-east-1 = "ami-01ccc867"
  }
}

resource "aws_instance" "example" {
  ami                   = var.AMI[var.AWS_REGION]
  instance_type         = "t2.micro"
}

