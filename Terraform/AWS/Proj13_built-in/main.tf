resource "aws_vpc" "main" {

cidr_block = var.vpc_cidr

tags = local.common_tags

}

resource "aws_subnet" "public" {

count = length(local.public_subnets)

vpc_id = aws_vpc.main.id

cidr_block = local.public_subnets[count.index]

availability_zone = format(
"%sa",
var.region
)

tags = merge(
local.common_tags,
{
Name = format(
"%s-public-%d",
local.project_name,
count.index+1
)
}
)

}

resource "aws_security_group" "web" {

name = "${local.project_name}-sg"

vpc_id = aws_vpc.main.id

}

resource "aws_instance" "web" {

ami = "ami-xxxxxxxx"

instance_type = local.instance_type

subnet_id = aws_subnet.public[0].id

user_data = templatefile(
"${path.module}/userdata.tpl",
{
hostname = local.project_name
environment = var.environment
}
)

tags = merge(
local.common_tags,
{
Name = local.project_name
}
)

}

resource "aws_iam_policy" "s3" {

name = "${local.project_name}-policy"

policy = jsonencode({

Version = "2012-10-17"

Statement = [

{

Action = [

"s3:GetObject"

]

Effect = "Allow"

Resource="*"

}

]

})

}