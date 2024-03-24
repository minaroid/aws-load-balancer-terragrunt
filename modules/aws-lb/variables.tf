
variable "alb_security_groups" {
  type        = list(string)
  default     = []
  description = "ELB security groups"
}

variable "public_subnets_ids" {
  description = "public subnets ids"
  type        = list(string)
  default     = []
}

variable "environment" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = ""
}
