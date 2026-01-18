locals {
  # Naming
  project = "isavara"
  name_prefix = "${local.project}-${var.environment}"

  # Common tags
  common_tags = {
    Project     = local.project
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "platform-team"
  }

  # Subnet CIDRs (calculated)
  public_subnets = [
    cidrsubnet(var.vpc_cidr, 8, 0),
    cidrsubnet(var.vpc_cidr, 8, 1)
  ]

  private_subnets = [
    cidrsubnet(var.vpc_cidr, 8, 10),
    cidrsubnet(var.vpc_cidr, 8, 11)
  ]
}
