resource "aws_instance" "webserver2" {
  ami = var.ami_value
  instance_type = var.instance_value
  subnet_id = aws_subnet.subnet2.id
  vpc_security_group_ids = [aws_security_group.websg.id]
  user_data = base64encode(file("userdata1.sh"))
}

resource "aws_lb" "myalb" {
  name = "myalb"
  load_balancer_type = "application"
  internal = false
  security_groups = [aws_security_group.websg.id]
  subnets = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]

  tags = {
    name = "web"
  }
}

resource "aws_lb_target_group" "tg" {
  vpc_id = aws_vpc.myvpc.id
  name = "mytg"
  port = "80"
  protocol = "HTTP"

  health_check {
    path = "/"
    port = "traffic-port"
  }
}

resource "aws_lb_target_group_attachment" "attach1" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id = aws_instance.webserver1.id
  port = 80
}

resource "aws_lb_target_group_attachment" "attach2" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id = aws_instance.webserver2.id
  port = 80
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.myalb.arn
  port = "80"
  protocol = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.tg.arn
    type = "forward"
  }
}

output "loadbalancerdns" {
  value = aws_lb.myalb.dns_name
}

