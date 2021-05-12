provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile                 = var.aws_profile
  region                  = var.AWS_REGION
}
