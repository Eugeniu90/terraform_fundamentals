resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraform-state-asdkdsgfldkhgfdghfdkj"
  acl    = "private"

  tags = {
    Name = "Terraform state"
  }
}

