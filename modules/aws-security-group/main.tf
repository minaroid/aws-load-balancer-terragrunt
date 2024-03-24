provider "aws" {
  region = var.region
}

// ALB instance 
resource "aws_security_group" "alb-sg" {
  vpc_id      = var.vpc_id
  name        = "${var.environment}-elb"
  description = "Allow http inbound traffic and all outbound traffic"
  tags = {
    Name : "${var.environment}-elb"
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb-allow-http-ipv4" {
  security_group_id = aws_security_group.alb-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "alb-allow-all-traffic-ipv4" {
  security_group_id = aws_security_group.alb-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}


// JumpBox Server.
resource "aws_security_group" "jumpbox-sg" {
  vpc_id      = var.vpc_id
  name        = "${var.environment}-jumpbox"
  description = "Allow http inbound traffic and all outbound traffic"
  tags = {
    Name : "${var.environment}-jumpbox"
  }
}

resource "aws_vpc_security_group_ingress_rule" "jumpbox-allow-http-ipv4" {
  security_group_id = aws_security_group.jumpbox-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "jumpbox-allow-ssh" {
  security_group_id = aws_security_group.jumpbox-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "jumpbox-allow-all-traffic-ipv4" {
  security_group_id = aws_security_group.jumpbox-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

// App Server 
resource "aws_security_group" "app-server-sg" {
  vpc_id      = var.vpc_id
  name        = "${var.environment}-app-server"
  description = "Allow http inbound traffic and all outbound traffic"
  tags = {
    Name : "${var.environment}-app-server"
  }
}

resource "aws_security_group_rule" "app-server-allow-ssh" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.app-server-sg.id
  source_security_group_id = aws_security_group.jumpbox-sg.id
}

resource "aws_security_group_rule" "app-server-allow-http-ipv4" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.app-server-sg.id
  source_security_group_id = aws_security_group.alb-sg.id
}

resource "aws_vpc_security_group_egress_rule" "app-server-allow-all-traffic-ipv4" {
  security_group_id = aws_security_group.app-server-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

