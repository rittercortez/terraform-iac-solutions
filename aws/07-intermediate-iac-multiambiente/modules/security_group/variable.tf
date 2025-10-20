variable "vpc_id" {
  type = string  
}
variable "vpc_cidr" {
  type = string
}
variable "environment" {
  type = string
}
variable "sg_name" {
  description = "Nombre del grupo de seguridad"
  type        = string
}
variable "sg_list_port_ingress" {
  description = "Puertos de acceso"
  type        = list(number)
}

variable "sg_ip_protocol" {
  description = "Tipo de protocolo IP"
  type        = string
}
variable "default_route_cidr" {
  description = "CIDR representa todo el tráfico IPv4"
  type = string
}

variable "egress_rules" {
  description = "Map of egress rules"
  type = map(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
  }))
}