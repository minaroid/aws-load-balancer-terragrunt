variable "vpc_id" {
  description = "vpc id"
}

variable "igw_id" {
  description = "Internet gateway id"
}


variable "private_subnets_ids" {
  description = "private subnets ids"
  type        = list(string)
  default     = []
}


variable "public_subnets_ids" {
  description = "public subnets ids"
  type        = list(string)
  default     = []
}

variable "nat_gateways_ids" {
  description = "nat gateway ids"
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