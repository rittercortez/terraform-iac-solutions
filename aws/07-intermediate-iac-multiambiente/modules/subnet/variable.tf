variable "vpc_id" {
  type = string
}
variable "subnet_public" {
  description = "Subred Public"
  type = map(object({
    subnet_name      = string
    subnet_cidr      = string
    subnet_ip_assign = bool
  }))
}
variable "subnet_private" {
  description = "Subred Privada"
  type = map(object({
    subnet_name      = string
    subnet_cidr      = string
    subnet_ip_assign = bool
  }))
}
variable "igw_name" {
  description = "Nombre de Internet Gateway"
  type        = string
}
variable "igw_cidr_block" {
  description = "CIDR para Internet Gateway"
  type = string
}
variable "ngw_name" {
  description = "Nombre de NAT Gateway"
  type = string
}

variable "route_table_private_name" {
  description = "Nombre de tabla de enrutamiento privada"
  type        = string
}
variable "route_table_public_name" {
  description = "Nombre de tabla de enrutamiento publica"
  type        = string
}

