provider "aws" {
  region = "ap-south-1"
}

variable "ami" {
  description = "this is describes AMI"
}

variable "instance_type" {
  description = "describe the Instance Type"
}

resource "aws_instance" "example" {
  ami = var.ami
  instance_type = var.instance_type
}
