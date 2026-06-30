locals {

##############################
# format()
##############################

project_name = lower(
format("%s-%s",
var.project,
var.environment)
)

##############################
# upper()
##############################

owner = upper(var.owner)

##############################
# lookup()
##############################

instance_type = lookup(
var.instance_types,
lower(var.environment),
"t3.micro"
)

##############################
# merge()
##############################

common_tags = merge(
{
Project = var.project
Environment = var.environment
},
{
Owner = local.owner
Created = timestamp()
}
)

##############################
# contains()
##############################

valid_environment = contains(
["dev","qa","prod"],
lower(var.environment)
)

##############################
# split()
##############################

project_parts = split(
"-",
"payment-api-web"
)

##############################
# join()
##############################

joined = join(
":",
local.project_parts
)

##############################
# replace()
##############################

resource_prefix = replace(
local.project_name,
"-",
"_"
)

##############################
# cidrsubnet()
##############################

public_subnets = [
for i in range(2):
cidrsubnet(
var.vpc_cidr,
8,
i
)
]

##############################
# cidrhost()
##############################

gateway_ip = cidrhost(
local.public_subnets[0],
1
)

##############################
# flatten()
##############################

servers = flatten([
["web1","web2"],
["api1","api2"]
])

##############################
# distinct()
##############################

unique_servers = distinct([
"web1",
"web1",
"api1",
"api2"
])

##############################
# length()
##############################

subnet_count = length(local.public_subnets)

##############################
# coalesce()
##############################

application = coalesce(
null,
"",
"Payment"
)

##############################
# try()
##############################

backup_instance_type = try(
var.instance_types["uat"],
"t3.micro"
)

}