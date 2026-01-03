resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.0.0/24"
}

resource "aws_security_group" "sg" {
    name = "websg"
    vpc_id = aws_vpc.myvpc.id
    
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = var.allowed_ssh_cidr
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id  = aws_vpc.myvpc.id
}

resource "aws_route_table" "public_rtb" {
    vpc_id = aws_vpc.myvpc.id
    route {
       cidr_block = "0.0.0.0/0"
       gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_association" "public_subnet" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public_rtb.id
}

resource "aws_instance" "myinstance" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = "mykey_pair"
    subnet_id = aws_security_group.sg.id
    tags = {
        Name = "${var.instance_name}-${var.environment}"
    }
}