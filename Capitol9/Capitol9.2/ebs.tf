resource "aws_ebs_volume" "dynamic_tags" {
  availability_zone = "eu-west-1b"
  size              = 10

  tags = {for k, v in merge({ Name = "Dynamic-Tags" }, var.detalii_curs): k => lower(v)}
}
