variable "AWS_REGION" {
  type    = string
  default = "us-east-1"
}
variable "detalii_curs" {
  type          = map(string)
  default       = {
    Curs        = "Terraform"
    Profesor    = "Eugeniu G."
    Societate   = "Telacad"
  }
}
variable "aws_profile" {
  default = "telacad-test"
}
