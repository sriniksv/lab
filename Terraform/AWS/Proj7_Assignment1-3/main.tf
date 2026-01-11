resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch = true
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
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = [aws_security_group.sg.id]
    key_name = data.aws_key_pair.existing.key_name
    tags = {
        Name = "${var.instance_name}-${var.environment}"
    }
}
