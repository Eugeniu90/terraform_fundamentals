terraform {
  backend "s3" {
    bucket         = "terraform-telacad-cursant-state"
    key            = "telacad-environment/terraform.tfstate"
    region         = "eu-west-1"
  }
}
