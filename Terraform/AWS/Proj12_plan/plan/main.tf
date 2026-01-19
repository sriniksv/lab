resource "aws_instance" "demo" {
  ami           = "ami-0a0f1259dd1c90938" # Amazon Linux (example)
  instance_type = var.instance_type

  tags = {
    Name        = "terraform-plan-demo"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
