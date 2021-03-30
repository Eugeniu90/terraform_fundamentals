resource "aws_security_group" "ingress_firewall" {
  name = "dynamic_ingress_firewall"

  dynamic "ingress" {
    for_each = [22, 443, 81, 80]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
    }
  }
}
