variable "environment" {
  type = string
}
variable "security_group" {
  description = "Grupos de seguridad"
  type        = string
}
#
variable "instance_name" {
  description = "Nombre de la instancia"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia"
  type        = string
}

variable "instance_amount" {
  description = "Cantidad de instancias"
  type        = number
}

variable "instance_ami" {
  description = "AMI de la instancia"
  type        = string
}

variable "instance_script" {
  description = "Script para aprovisionar la instancia"
  type        = string
}



