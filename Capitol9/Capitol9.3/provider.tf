variable "aws_profile" {
  default = "telacad-test"
}
variable "AWS_REGION" {
  type    = string
  default = "us-east-1"
}

provider "aws" {
  shared_credentials_file = "~/.aws/telacad"
  profile                 = var.aws_profile
  region                  = var.AWS_REGION
}
