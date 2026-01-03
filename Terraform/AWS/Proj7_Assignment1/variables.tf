variable "region" {
    description = "region where the infra going to build"
}
variable "instance_name" {
    description = "name of the Instance"
}

variable "ami_id" {
    description = "Declare the AMI ID"
    default = "ami-0ecb62995f68bb549"
}
variable "instance_type" {
    description = "Instance Type"
    default = "t3.small"
}
variable "environment" {
    description = "update the Environment"
}
variable "allowed_ssh_cidr" {
    description = "laptop IP"
}