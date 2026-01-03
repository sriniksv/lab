provider "aws" {
  region = "ap-south-1"
}

variable "ami" {
  description = "describe the ami value"
}

variable "instance_type" {
  description = "describe the Instance Type"
  type = map(string)

  default = {
    "dev" = "t3.micro"
    "prod" = "t3.small"
   }
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami = var.ami
  instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
}
