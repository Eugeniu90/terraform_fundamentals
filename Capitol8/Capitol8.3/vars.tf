variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "aws_profile" {
  default = "telacad-test"
}


variable "CHEIE_PRIVATA" {
  default = "telacad"
}

variable "CHEIE_PUBLICA" {
  default = "telacad.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
  }
}
