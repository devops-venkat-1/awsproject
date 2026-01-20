data "aws_security_group" "db" {
  name = var.database_sg_name
}

data "aws_subnet" "subnet1" {
  filter { name = "tag:Name" values = [var.private_subnet_1] }
}

data "aws_subnet" "subnet2" {
  filter { name = "tag:Name" values = [var.private_subnet_2] }
}

resource "aws_db_subnet_group" "this" {
  subnet_ids = [data.aws_subnet.subnet1.id, data.aws_subnet.subnet2.id]
}

resource "aws_db_instance" "this" {
  identifier        = var.db_identifier
  engine            = "mysql"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  username          = var.db_username
  password          = var.db_password
  db_name           = var.db_name
  vpc_security_group_ids = [data.aws_security_group.db.id]
  db_subnet_group_name   = aws_db_subnet_group.this.name
  skip_final_snapshot = true
}

