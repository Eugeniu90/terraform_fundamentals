resource "aws_key_pair" "mykey" {
  key_name   = "telacad-key"
  public_key = file(var.CHEIE_PUBLICA)
}

