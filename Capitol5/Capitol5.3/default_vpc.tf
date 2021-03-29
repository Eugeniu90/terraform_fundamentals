#  VPC -ul implicit
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Implicit VPC"
  }
}

# implicitele subnets
resource "aws_default_subnet" "principalul_a_zone1" {
  availability_zone = "${var.AWS_REGION}a"

  tags = {
    Name = "Subneturile implicite pentru  ${var.AWS_REGION}a"
  }
}

resource "aws_default_subnet" "principalul_a_zone2" {
  availability_zone = "${var.AWS_REGION}b"

  tags = {
    Name = "Subneturile implicite pentru  ${var.AWS_REGION}b"
  }
}

resource "aws_default_subnet" "principalul_a_zone3" {
  availability_zone = "${var.AWS_REGION}c"

  tags = {
    Name = "Subneturile implicite pentru  ${var.AWS_REGION}c"
  }
}

