resource "aws_instance" "app" {
  ami           = "ami-0a0f1259dd1c90938"
  instance_type = var.instance_type

  tags = {
    Name        = "runtime-var-demo"
    Environment = var.environment
  }
}
