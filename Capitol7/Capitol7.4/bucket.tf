resource "aws_s3_bucket" "terraform-example-state" {
  bucket = "example-infrastructure-state"

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
    Name = "S3 Terraform State pentru Example - Terraform Curs"
  }
}

output "s3_output_bucket_name" {
  value     = aws_s3_bucket.terraform-example-state.bucket_domain_name
  sensitive = true
}

output "s3_output_bucket_arn" {
  value     = aws_s3_bucket.terraform-example-state.arn
  sensitive = false
}

output "s3_output_bucket_id" {
  value     = aws_s3_bucket.terraform-example-state.id
  sensitive = true
}