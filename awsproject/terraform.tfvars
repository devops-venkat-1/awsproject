# NETWORK
vpc_name  = "Prod-VPC"
vpc_cidr = "172.16.0.0/16"
igw_name = "Prod-IGW"

public_subnet_cidr_1 = "172.16.1.0/24"
public_subnet_name_1 = "Prod-Public-Subnet-A"

public_subnet_cidr_2 = "172.16.2.0/24"
public_subnet_name_2 = "Prod-Public-Subnet-B"

private_subnet_cidr_1 = "172.16.3.0/24"
private_subnet_name_1 = "Prod-Private-Subnet-A"

private_subnet_cidr_2 = "172.16.4.0/24"
private_subnet_name_2 = "Prod-Private-Subnet-B"

nat_name_1 = "Prod-NAT-A"
nat_name_2 = "Prod-NAT-B"

# SECURITY
alb_sg_name      = "prod-alb-sg"
app_sg_name      = "prod-app-sg"
database_sg_name = "prod-db-sg"

# DATABASE
db_identifier = "prod-db"
db_name       = "appdb"
db_username   = "dbadmin"
db_password   = "StrongPass123!"

# LOAD BALANCER
alb_name     = "prod-alb"
target_group = "prod-app-tg"

# IAM
role_name    = "prod-ec2-role"
policy_name  = "prod-ssm-policy"
profile_name = "prod-instance-profile"

# AUTOSCALING
asg_name      = "prod-asg"
ami_name      = "amazon-linux-2023"
instance_type = "t3.micro"

# DNS / CDN / WAF
domain_name = "exampleprodapp.com"
cdn_name    = "prod-cloudfront"
waf_name    = "prod-waf"

