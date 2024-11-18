variable "env_localstack" {
  description = "Los valores necesarios para localstack"
  type        = map(string)
}

variable "regiones" {
  description = "Regiones de AWS"
  type        = map(string)
}
variable "vpc" {
  description = "VPC principal"
  type        = string
}

variable "subnet_flex" {
  description = " Subredes públicas y privadas"
  type = object({
    num_subnet_public  = list(string)
    num_subnet_private = map(string)
  })
}

variable "security_group" {
  description = "Security Group value"
  type = object({
    all_ip_access     = string
    cidr_ssh          = string
    ingress_list_port = list(number)
  })
}
variable "nat_gw" {
  description = "Sirve para implementar o no el NAT gateway"
  type        = bool
}
variable "igw_deny_or_allow" {
  description = "Permite o  no el acceso a internet si la subred es pública o privada"
  type        = string
}
variable "ec2" {
  description = "Instancia EC2 y sus requerimientos"
  type = object({
    ami          = string
    type_intance = string
  })
}
variable "tags" {
  description = "Etiquetas comunes"
  type        = map(string)

}
