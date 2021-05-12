resource "aws_s3_bucket" "bucket-testing-12345-bucket-mybucket-c29df1" {
  bucket = "mybucket-c29df1c29df1"
  acl    = "private"

  tags = {
    Name = "mybucket-c29df1"
  }
}

