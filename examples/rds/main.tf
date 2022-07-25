provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "2.78.0"
  name                 = "vpc"
  cidr                 = "10.0.0.0/16"
  azs                  = ["us-east-1a", "us-east-1c", "us-east-1d"]
  public_subnets       = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  private_subnets      = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_s3_endpoint   = true
  enable_ipv6          = true
}

module "security_group" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "~> 3.0"
  name                = "VPN Servers"
  description         = "VPN Servers Security Group"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  use_name_prefix     = false
  ingress_with_cidr_blocks = [
    {
      from_port = 80
      to_port   = 80
      protocol  = "tcp"
    },
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}


module "ssm_parameter_store_random" {
  source = "../../"
  name   = "/test/parameter"
  value  = "" # If value is empty module will create a random string
  type   = "SecureString"
}

module "rds_instance_01" {
  source                          = "git::https://gitlab.com/ganex-cloud/terraform/terraform-aws-rds?ref=0.12"
  engine                          = "mariadb"
  port                            = 3306
  identifier                      = "instance-01"
  engine_version                  = "10.5.12"
  major_engine_version            = "10.5"
  instance_class                  = "db.t3.small"
  allocated_storage               = 40
  storage_encrypted               = true
  username                        = "root"
  password                        = module.ssm_parameter_store_random.value
  subnet_ids                      = module.vpc.private_subnets
  vpc_id                          = module.vpc.vpc_id
  publicly_accessible             = false
  monitoring_interval             = 60
  source_security_group_id        = [module.security_group.this_security_group_id]
  maintenance_window              = "mon:06:00-mon:07:00"
  backup_window                   = "04:10-05:10"
  apply_immediately               = true
  final_snapshot_identifier       = "instance-01-final-snapshot"
  enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
  option_group_use_name_prefix    = true
  parameter_group_use_name_prefix = true
}
