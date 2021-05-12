variable "AWS_REGION" {
  default = "us-east-1"
}

variable "aws_profile" {
  default = "telacad-test"
}

variable "tags" {
  type = map(string)
}
variable "name" {}

variable "instance_count" {
  type = number
}
