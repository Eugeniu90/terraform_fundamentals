resource "aws_key_pair" "telacad_key" {
  key_name   = "telacad_key"
  public_key = file(var.CHEIE_PUBLICA)
}