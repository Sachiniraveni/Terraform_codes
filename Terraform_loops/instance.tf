provider "aws" {
  access_key = "##############"
  secret_key = "###########"
  region = "${var.region}"
}

resource "aws_instance" "example" {
  ami = "ami-04bf6dcdc9ab498ca"
  instance_type = "t2.micro"
}

resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "main" {
  count = "${length(data.aws_availability_zones.azs.names)}"
  cidr_block = "${element(var.subnet_cidr, count.index)}"
  vpc_id = "${aws_vpc.main.id}"
  availability_zone = "${element(data.aws_availability_zones.azs.names, count.index )}"

  tags = {
    Name ="Subnet-${count.index+1}"
  }
}

