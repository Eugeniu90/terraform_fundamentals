//resource "aws_s3_bucket" "terraform-telacad-cursant-state" {
//  bucket = "telacad-infrastructure-state"
//  versioning {
//    enabled = true
//  }
//  lifecycle {
//    prevent_destroy = false
//  }
//  tags = {
//    Name = "S3 Terraform State pentru Telacad - Terraform Curs"
//  }
//}