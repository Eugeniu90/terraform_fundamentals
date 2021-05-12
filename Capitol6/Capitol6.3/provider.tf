provider "aws" {
  shared_credentials_file = "~/.aws/telacad"
  profile                 = var.aws_profile
  region                  = var.AWS_REGION
}

provider "random" {
  version = "~> 2.1"
}

provider "local" {
  version = "~> 1.2"
}

provider "null" {
  version = "~> 2.1"
}

provider "template" {
  version = "~> 2.1"
}
