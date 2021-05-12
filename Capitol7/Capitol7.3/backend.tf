terraform {
  backend "s3" {
    bucket         = "terraform-demo-eugeniu"
    key            = "demo-environment/terraform.tfstate"
    region         = "us-east-1"
    session_name   = "terraform"
    profile        = "telacad-test"
    kms_key_id     = "test-telacad"
    encrypt        = true
  }

}