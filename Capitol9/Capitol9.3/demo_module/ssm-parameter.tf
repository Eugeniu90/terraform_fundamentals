resource "aws_ssm_parameter" "parametru_demo" {
  type  = "String"
  name  = var.nume
  value = var.valoare
}
