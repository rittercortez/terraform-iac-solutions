variable "vpc_cidr" {
  description = "CIDR  de la VPC"
  type        = string
  default     = "10.2.0.0/16"
}

variable "vpc_name" {
  type    = string
  default = "VPC-principal"
}
