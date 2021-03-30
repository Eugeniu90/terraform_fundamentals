resource "aws_s3_bucket" "terraform-telacad-cursant-state" {
  bucket = "telacad-infrastructure-state"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = false
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    Name = "S3 Terraform State pentru Telacad - Terraform Curs"
  }
}