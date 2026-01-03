variable "cidr_value" {
  description = "defining the CIDR Value"
  default = "10.1.0.0/16"
}

variable "region_value" {
  description = "declaring the region"
  default = "us-east-1"
}

variable "first_zone" {
  default = "us-east-1a"
}

variable "second_zone" {
  default = "us-east-1b"
}

variable "subnet1_value" {
  description = "describing subnet1 value"
  default = "10.0.3.0/24"
}

variable "subnet2_value" {
   description = "describing subnet2 value"
   default = "10.0.4.0/24"
}

variable "ami_value" {
  description = "declaring the ami value"
  default = "ami-087d1c9a513324697"
}

variable "instance_value" {
  description = "decalring Instance Value"
  default = "t3.small"
}
