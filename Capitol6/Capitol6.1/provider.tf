provider "aws" {
  shared_credentials_file = "~/.aws/telacad"
  profile                 = var.aws_profile
  region                  = var.AWS_REGION
}