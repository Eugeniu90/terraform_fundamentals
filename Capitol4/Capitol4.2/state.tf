provider "aws" {
  region  = "eu-west-1"

}

#######################################
# Cream un s3 bucket pentru remote state  #
#######################################

resource "aws_s3_bucket" "terraform-telacad-cursant-state" {
    bucket = "telacad-infrastructure-state"
    versioning {
      enabled = true
    }
    lifecycle {
      prevent_destroy = false
    }
    tags = {
      Name = "S3 Terraform State pentru Telacad - Terraform Curs"
    }
}
