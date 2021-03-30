resource "aws_ssm_parameter" "parametru_demo" {
  name  = "/telacad/cursant"
  type  = "String"
  value = "Grigore"
}
