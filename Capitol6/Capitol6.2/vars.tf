variable "AWS_REGION" {
  default = "eu-west-1"
}
variable "tags" {
  type = map(string)
}
variable "name" {}

variable "instance_count" {
  type = number
}
