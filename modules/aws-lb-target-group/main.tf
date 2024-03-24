provider "aws" {
  region = var.region
}
resource "aws_lb_target_group" "app-target-group" {
  name     = "${var.environment}-app-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 20
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}