variable "region" {
    description = "specify the region"
}

variable "instance_name" {
    description = "name of the Instance"
}

variable "ami_id" {
    description = "Declare the AMI ID"
    default = "ami-02b8269d5e85954ef"
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
variable "key_name" {
    description = "read the existing key pair"
    type = string
    default = "sriniksv_keypair"
}
