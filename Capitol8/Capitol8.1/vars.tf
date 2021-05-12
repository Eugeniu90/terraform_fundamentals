variable "AWS_REGION" {
  default = "us-east-1"
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
    us-east-1 = "ami-844e0bf7"
  }
}

variable "RDS_PASSWORD" {
}

variable "RDS_USERNAME" {
  default = "root"
}

variable "RDS_ENGINE" {
  default = "mariadb"
}

variable "ENGINE_VERSION" {
  default = "10.5.8"
}

variable "INSTANCE_CLASS" {
  default = "db.t2.micro"
}

variable "INSTANCE_STORAGE" {
  type    = number
  default = 100
}

