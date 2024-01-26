/*====
Variables used across all modules
======*/
locals {
  environment = "fast-food"
}

provider "aws" {
  region = var.region
}

module "rds" {
  source            = "./rds"
  environment       = local.environment
  allocated_storage = "20"
  database_name     = var.production_database_name
  database_username = var.production_database_username
  database_password = var.production_database_password
  subnet_ids        = ["subnet-07cfdc74862fb5a39", "subnet-0d7c3c1a48777ce60"]
  vpc_id            = "vpc-0fe5292222d495854"
  instance_class    = "db.t3.micro"
}
