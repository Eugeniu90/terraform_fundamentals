terraform {
  backend "s3" {
    bucket         = "terraform-telacad-state"
    key            = "telacad-environment/"
    region         = "eu-west-1"
  }
}
