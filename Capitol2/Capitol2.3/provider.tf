provider "aws" {
}

variable "AWS_REGION"{
}

variable "AMI" {

  default = {
    eu-west-1 = "ami-01ccc867"
  }
}

resource "aws_instance" "example" {
  ami                   = var.AMI[var.AWS_REGION]
  instance_type         = "t2.micro"
}

