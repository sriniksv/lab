variable "region" {
  default = "us-east-1"
}

variable "project" {
  default = "Payment"
}

variable "environment" {
  default = "Prod"
}

variable "vpc_cidr" {
  default = "10.10.0.0/16"
}

variable "instance_types" {
  default = {
    dev  = "t3.micro"
    qa   = "t3.small"
    prod = "t3.medium"
  }
}

variable "owner" {
  default = "DevOps"
}