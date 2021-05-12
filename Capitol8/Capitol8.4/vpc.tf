# Internet VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "main"
  }
}

# Subnets
resource "aws_subnet" "public-principal-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "public-principal-1"
  }
}

resource "aws_subnet" "public-principal-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "public-principal-2"
  }
}

resource "aws_subnet" "public-principal-3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "public-principal-3"
  }
}

resource "aws_subnet" "privat-principal-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "privat-principal-1"
  }
}

resource "aws_subnet" "privat-principal-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "privat-principal-2"
  }
}

resource "aws_subnet" "privat-principal-3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "privat-principal-3"
  }
}

# Internet GW
resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

# Tabelele de rutare
resource "aws_route_table" "public-principal" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }

  tags = {
    Name = "public-principal-1"
  }
}

# Asociem tabelele de rutare
resource "aws_route_table_association" "public-principal-1-a" {
  subnet_id      = aws_subnet.public-principal-1.id
  route_table_id = aws_route_table.public-principal.id
}

resource "aws_route_table_association" "public-principal-2-a" {
  subnet_id      = aws_subnet.public-principal-2.id
  route_table_id = aws_route_table.public-principal.id
}

resource "aws_route_table_association" "public-principal-3-a" {
  subnet_id      = aws_subnet.public-principal-3.id
  route_table_id = aws_route_table.public-principal.id
}

