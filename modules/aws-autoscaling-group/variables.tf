variable "app_launch_configuration_id" {
  type    = string
  default = ""
}

variable "private_subnets_ids" {
  description = "private subnets ids"
  type        = list(string)
  default     = []
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

variable "max_size" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 2
}

variable "desired_capacity" {
  type    = number
  default = 2
}