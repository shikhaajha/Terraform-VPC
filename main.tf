terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
#configure aws provider
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "vpc" {
  source = "./modules/vpc"

}

module "ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet
  subnet_id2 = module.vpc.public_subnet2
  
  security_group = module.vpc.security
}


# module "rds" {
#   source = "./modules/rds"
#   vpc_id = module.vpc.vpc_id
#   subnet_id = module.vpc.public_subnet
#   subnet_id2 = module.vpc.public_subnet2
  
#   security_group = module.vpc.security
# }
module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet
  subnet_id2 = module.vpc.public_subnet2
  instance_id1 = module.ec2.instance_id1
  instance_id2 = module.ec2.instance_id2
  security_group = module.vpc.security
}