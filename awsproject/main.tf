module "network" {
  source = "./modules/network"

  vpc_name  = var.vpc_name
  vpc_cidr = var.vpc_cidr
  igw_name = var.igw_name

  public_subnet_cidr_1 = var.public_subnet_cidr_1
  public_subnet_name_1 = var.public_subnet_name_1
  public_subnet_cidr_2 = var.public_subnet_cidr_2
  public_subnet_name_2 = var.public_subnet_name_2

  private_subnet_cidr_1 = var.private_subnet_cidr_1
  private_subnet_name_1 = var.private_subnet_name_1
  private_subnet_cidr_2 = var.private_subnet_cidr_2
  private_subnet_name_2 = var.private_subnet_name_2

  nat_name_1 = var.nat_name_1
  nat_name_2 = var.nat_name_2
}

module "security" {
  source = "./modules/security"

  vpc_name          = var.vpc_name
  alb_sg_name       = var.alb_sg_name
  app_sg_name       = var.app_sg_name
  database_sg_name  = var.database_sg_name

  depends_on = [module.network]
}

module "database" {
  source = "./modules/database"

  db_identifier     = var.db_identifier
  db_name           = var.db_name
  db_username       = var.db_username
  db_password       = var.db_password
  database_sg_name  = var.database_sg_name

  private_subnet_1  = var.private_subnet_name_1
  private_subnet_2  = var.private_subnet_name_2

  depends_on = [module.security]
}

module "loadbalancer" {
  source = "./modules/loadbalancer"

  alb_name      = var.alb_name
  target_group = var.target_group
  alb_sg_name  = var.alb_sg_name
  vpc_name     = var.vpc_name

  public_subnet_1 = var.public_subnet_name_1
  public_subnet_2 = var.public_subnet_name_2
}

module "iam_role" {
  source = "./modules/iam_role"

  role_name    = var.role_name
  policy_name  = var.policy_name
  profile_name = var.profile_name
}

module "autoscaling_group" {
  source = "./modules/autoscaling_group"

  asg_name       = var.asg_name
  ami_name       = var.ami_name
  instance_type  = var.instance_type
  profile_name  = var.profile_name
  app_sg_name   = var.app_sg_name
  target_group  = var.target_group

  public_subnet_1 = var.public_subnet_name_1
  public_subnet_2 = var.public_subnet_name_2

  depends_on = [module.loadbalancer]
}

module "dns_cdn_waf" {
  source = "./modules/dns_cdn_waf"

  domain_name = var.domain_name
  alb_name    = var.alb_name
  cdn_name    = var.cdn_name
  waf_name    = var.waf_name

  depends_on = [module.autoscaling_group]
}

