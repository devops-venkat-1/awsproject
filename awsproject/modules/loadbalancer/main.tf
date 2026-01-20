data "aws_vpc" "this" {
  filter { name = "tag:Name" values = [var.vpc_name] }
}

data "aws_subnet" "s1" {
  filter { name = "tag:Name" values = [var.public_subnet_1] }
}

data "aws_subnet" "s2" {
  filter { name = "tag:Name" values = [var.public_subnet_2] }
}

data "aws_security_group" "alb" {
  name = var.alb_sg_name
}

resource "aws_lb" "this" {
  name               = var.alb_name
  load_balancer_type = "application"
  subnets            = [data.aws_subnet.s1.id, data.aws_subnet.s2.id]
  security_groups    = [data.aws_security_group.alb.id]
}

resource "aws_lb_target_group" "this" {
  name     = var.target_group
  port     = 80
  protocol = "HTTP"
  vpc_id  = data.aws_vpc.this.id
}

