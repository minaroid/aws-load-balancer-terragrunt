variable "availability_zones" {
  type    = list(string)
  default = []
}

variable "private_subnets_cidr_blocks" {
  type    = list(string)
  default = []
}

variable "public_subnets_cidr_blocks" {
  type    = list(string)
  default = []
}

variable "vpc_id" {
  description = "vpc id"
}

variable "region" {
  type    = string
  default = ""
}

variable "environment" {
  type    = string
  default = ""
}
