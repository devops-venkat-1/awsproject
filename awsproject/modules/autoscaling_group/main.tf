variable "asg_name" {}
variable "ami_name" {}
variable "instance_type" {}
variable "profile_name" {}
variable "app_sg_name" {}
variable "target_group" {}
variable "public_subnet_1" {}
variable "public_subnet_2" {}

data "aws_ami" "this" {
  most_recent = true
  owners = ["amazon"]
  filter { name = "name" values = ["al2023-ami-*"] }
}

resource "aws_launch_template" "this" {
  name_prefix   = "lt-"
  image_id      = data.aws_ami.this.id
  instance_type = var.instance_type
}

resource "aws_autoscaling_group" "this" {
  name = var.asg_name
  max_size = 2
  min_size = 1
  desired_capacity = 1
  launch_template {
    id = aws_launch_template.this.id
    version = "$Latest"
  }
}

