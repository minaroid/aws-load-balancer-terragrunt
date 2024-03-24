provider "aws" {
  region = var.region
}

resource "aws_lb" "app-alb" {
  name               = "${var.environment}-app-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = var.alb_security_groups
  subnets         = var.public_subnets_ids

  tags = {
    Name = "${var.environment}-app-alb"
  }
}
