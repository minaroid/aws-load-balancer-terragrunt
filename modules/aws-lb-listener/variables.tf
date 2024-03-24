variable "app_alb_arn" {
  description = "App ALB arn"
}

variable "app_target_group_arn" {
  description = "App trarget group arn"
}

variable "environment" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = ""
}
