provider "aws" {
  region = var.region
}
resource "aws_lb_listener" "app-alb-listener" {
  load_balancer_arn = var.app_alb_arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    order            = 1
    target_group_arn = var.app_target_group_arn
    type             = "forward"
  }

}