variable "regiones" {
  description = "Regiones de AWS"
  type        = map(string)
}
variable "network_vpc" {
    description = "Recursos necesarios para la VPC"
    type = object({
      vpc_cidr = string
      subnet_cidr = string
      sg_egress_cidr = string
    })
  
}
