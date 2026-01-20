resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags = { Name = var.vpc_name }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = { Name = var.igw_name }
}

resource "aws_subnet" "public_1" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.public_subnet_cidr_1
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = { Name = var.public_subnet_name_1 }
}

resource "aws_subnet" "public_2" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.public_subnet_cidr_2
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  tags = { Name = var.public_subnet_name_2 }
}

resource "aws_subnet" "private_1" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.private_subnet_cidr_1
  availability_zone = "us-east-1a"
  tags = { Name = var.private_subnet_name_1 }
}

resource "aws_subnet" "private_2" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.private_subnet_cidr_2
  availability_zone = "us-east-1b"
  tags = { Name = var.private_subnet_name_2 }
}

