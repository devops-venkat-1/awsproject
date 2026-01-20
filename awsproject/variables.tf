# NETWORK
variable "vpc_name" {}
variable "vpc_cidr" {}
variable "igw_name" {}

variable "public_subnet_cidr_1" {}
variable "public_subnet_name_1" {}
variable "public_subnet_cidr_2" {}
variable "public_subnet_name_2" {}

variable "private_subnet_cidr_1" {}
variable "private_subnet_name_1" {}
variable "private_subnet_cidr_2" {}
variable "private_subnet_name_2" {}

variable "nat_name_1" {}
variable "nat_name_2" {}

# SECURITY
variable "alb_sg_name" {}
variable "app_sg_name" {}
variable "database_sg_name" {}

# DATABASE
variable "db_identifier" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {
  sensitive = true
}

# LOAD BALANCER
variable "alb_name" {}
variable "target_group" {}

# IAM
variable "role_name" {}
variable "policy_name" {}
variable "profile_name" {}

# AUTOSCALING
variable "asg_name" {}
variable "ami_name" {}
variable "instance_type" {}

# DNS / CDN / WAF
variable "domain_name" {}
variable "cdn_name" {}
variable "waf_name" {}

