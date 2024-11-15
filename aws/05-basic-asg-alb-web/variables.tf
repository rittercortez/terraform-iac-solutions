variable "regiones" {
  description = "Regiones de AWS"
  type        = map(string)
}
variable "network_vpc" {
  description = "Recursos necesarios para la VPC"
  type = object({
    vpc_cidr       = string
    subnet_cidr    = string
    sg_egress_cidr = string
  })

}

locals {
  localstack_accesskey = "test"
  localstack_secretkey = "test"
  container            = "http://172.17.0.2:4566"
  Owner                = "SoyRitter"
  ManagedBy            = "Terraform"
  Version              = "1.0.0"

}
