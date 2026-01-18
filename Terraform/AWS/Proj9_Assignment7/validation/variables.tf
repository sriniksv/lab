variable "aws_region" {
  type        = string
  description = "AWS region"

  validation {
    condition     = contains(["us-east-1", "us-west-2"], var.aws_region)
    error_message = "Only us-east-1 or us-west-2 are allowed."
  }
}

variable "environment" {
  type        = string
  description = "Deployment environment"

  validation {
    condition     = contains(["dev", "stage", "prod"], var.environment)
    error_message = "Environment must be dev, stage, or prod."
  }
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"

  validation {
    condition = contains(
      ["t3.micro", "t3.small", "m5.large"],
      var.instance_type
    )
    error_message = "Instance type not approved."
  }
}
