terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-vpc"
    }
  )
}

resource "aws_subnet" "public" {
  count             = length(local.public_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = local.public_subnets[count.index]
  availability_zone = "${var.region}${count.index == 0 ? "a" : "b"}"

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-public-${count.index + 1}"
      Type = "public"
    }
  )
}

resource "aws_subnet" "private" {
  count             = length(local.private_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = local.private_subnets[count.index]
  availability_zone = "${var.region}${count.index == 0 ? "a" : "b"}"

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-private-${count.index + 1}"
      Type = "private"
    }
  )
}
