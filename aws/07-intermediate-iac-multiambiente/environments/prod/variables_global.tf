# Variables globales para nuestro archivo provider y para el contenedor
variable "region" {
  description = "Regiones de aws"
  type        = string
}
/* variable "environment" {
  description = "Entorno de trabajo"
  type = string
} */
locals {
  localstack_accesskey = "test"
  localstack_secretkey = "test"
  localstack_container = "http://<ip>:4066"
  # Tags - Por defecto
  Owner     = "SoyRitter"
  ManagedBy = "Terraform"
  Version   = "1.0.0"

}