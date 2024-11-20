variable "environment" {
  type = string
}
variable "lb_name" {
  description = "Nombre del Load Balancer"
  type        = string
}
variable "lb_type" {
  description = "Tipos de Load Balancer"
  type        = string
}
variable "lb_conditional" {
  description = "La palabra clave  comparativa en la condición"
  type = string
  default = "Producción"
}