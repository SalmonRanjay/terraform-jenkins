provider "aws" {
  profile                 = "rjay"
  region                  = var.region
  shared_credentials_file = "~/.aws/credentials"
}

terraform {
  backend "s3" {
    bucket = "ddl-terraform-practice"
    key    = "module.tfstate"
    region = "us-east-1"
  }
}


module "my_vpc" {
  source      = "../modules/vpc"
  vpc_cidr    = "192.168.0.0/16"
  tenancy     = "default"
  vpc_id      = "${module.my_vpc.vpc_id}"
  subnet_cidr = "192.168.1.0/24"
}



module "ec2" {
  source        = "../modules/ec2"
  ec2_count     = 1
  instance_type = "t2.micro"
  subnet_id     = "${module.my_vpc.subnet_id}"
  ami_id        = "ami-02b5d851009884e20"
  security_groups = [module.my_vpc.security_groups]
}
