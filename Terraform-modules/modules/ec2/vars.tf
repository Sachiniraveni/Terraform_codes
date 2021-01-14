variable "ami_id" {
  default = "ami-04bf6dcdc9ab498ca"
}
variable "instance_type" {
  default = "t2.micro"
}

variable "ec2_count" {
  default = "1"
}

variable "subnet_id" {}