provider "aws" {
  region = var.region
}

resource "aws_lb_listener_rule" "app-alb-listener-rule" {
  listener_arn = var.app_alb_listener_arn
  priority     = 1
  action {
    order            = 1
    target_group_arn = var.app_target_group_arn
    type             = "forward"
  }
  condition {
    path_pattern {
      values = [
        "/"
      ]
    }
  }

}