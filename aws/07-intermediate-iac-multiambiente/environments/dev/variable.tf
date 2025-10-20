# Nuestro entorno actual
variable "environment" {
  type = string
  default = "Desarrollo"
}
# Configuración de VPC
variable "vpc_cidr_dev" {
  type = string
  default = "10.2.0.0/16"
}
variable "vpc_name_dev" {
  type = string
}

# Subnets
variable "subnet_public_dev" {
  description = "Subred Public"
  type = map(object({
    subnet_name      = string
    subnet_cidr      = string
    subnet_ip_assign = bool
  }))
}
variable "subnet_private_dev" {
  description = "Subred Privada"
  type = map(object({
    subnet_name      = string
    subnet_cidr      = string
    subnet_ip_assign = bool
  }))
}
variable "igw_name_dev" {
  description = "Nombre de Internet Gateway"
  type        = string
}
variable "igw_cidr_block_dev" {
  description = "CIDR para Internet Gateway"
  type = string
}
variable "ngw_name_dev" {
  description = "Nombre de NAT Gateway"
  type = string
}

variable "route_table_private_name_dev" {
  description = "Nombre de tabla de enrutamiento privada"
  type        = string
}
variable "route_table_public_name_dev" {
  description = "Nombre de tabla de enrutamiento publica"
  type        = string
}

# Security Group
variable "sg_name_dev" {
  description = "Nombre del grupo de seguridad"
  type        = string
}
variable "sg_list_port_ingress_dev" {
  description = "Puertos de acceso"
  type        = list(number)
}

variable "sg_ip_protocol_dev" {
  description = "Tipo de protocolo IP"
  type        = string
}
variable "default_route_cidr_dev" {
  description = "CIDR representa todo el tráfico IPv4"
  type = string
}

variable "egress_rules_dev" {
  description = "Map of egress rules"
  type = map(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
  }))
}

# Instancia
variable "instance_name_dev" {
  description = "Nombre de la Instancia"
  type        = string
}
variable "instance_type_dev" {
  description = "Tipo de Instancia"
  type        = string
}
variable "instance_amount_dev" {
  description = "Cantidad de Instancias"
  type        = number
}
variable "instance_ami_dev" {
  description = "AMI  de Instancia"
  type        = string
}
variable "instance_script_dev" {
  description = "Script para aprovisionar la instancia"
  type        = string
}