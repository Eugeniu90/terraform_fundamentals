variable "AWS_REGION" {
  type    = string
  default = "eu-west-1"
}
variable "detalii_curs" {
  type          = map(string)
  default       = {
    Curs        = "Terraform"
    Profesor    = "Eugeniu G."
    Societate   = "Telacad"
  }
}

