provider "aws" {
  access_key = "###########"
  secret_key = "#############"
  region = "us-east-1"
}

module "my_vpc" {
  source = "../modules/vpc"
  vpc_cidr = "192.168.0.0/16"
  tenancy = "default"
  subnet_cidr = "192.168.1.0/24"
}

module "my_ec2" {
  source = "../modules/ec2"
  count = 1
  subnet_id = "${module.my_vpc.subnet_id}"
}
