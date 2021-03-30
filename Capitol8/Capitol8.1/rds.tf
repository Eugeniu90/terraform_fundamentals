resource "aws_db_subnet_group" "subnetul-mariadb" {
  name        = "subnetul-mariadb"
  description = "RDS subnet"
  subnet_ids  = [aws_subnet.privat-principal-1.id, aws_subnet.privat-principal-2.id]
}

resource "aws_db_parameter_group" "parametrii-mariadb" {
  name        = "parametrii-mariadb"
  family      = "mariadb10.1"
  description = "Parametrii de grup din cadrul MariaDB"

  parameter {
    name  = "max_allowed_packet"
    value = "16777216"
  }
}

resource "aws_db_instance" "mariadb" {

  name                    = var.RDS_ENGINE
  engine                  = var.RDS_ENGINE
  identifier              = var.RDS_ENGINE
  engine_version          = var.RDS_ENGINE
  instance_class          = var.INSTANCE_CLASS
  allocated_storage       = var.INSTANCE_STORAGE
  username                = var.RDS_USERNAME
  password                = var.RDS_PASSWORD
  db_subnet_group_name    = aws_db_subnet_group.subnetul-mariadb.name
  parameter_group_name    = aws_db_parameter_group.parametrii-mariadb.name
  multi_az                = "false"
  vpc_security_group_ids  = [aws_security_group.allow-mariadb.id]
  storage_type            = "gp2"
  backup_retention_period = 30
  availability_zone       = aws_subnet.privat-principal-1.availability_zone
  skip_final_snapshot     = true
  tags = {
    Name    = "MariaDB",
    Tool    = "Terraform",
    Version = "0.14.4"
    Created = "Automat"
  }
}

