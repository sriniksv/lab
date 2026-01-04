# Read existing key pair
data "aws_key_pair" "existing" {
  key_name = var.key_name
}
