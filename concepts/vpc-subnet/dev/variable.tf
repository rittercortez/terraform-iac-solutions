variable "region" {
  description = "Regiones de aws"
  type        = string
  default = "us-east-1"
}

variable "access_secret_key" {
  description = "Valores necesario para el contenedor localstack"
  type        = string
  default = "test"
}

variable "tags" {
  description = "Etiquetas globales para todos los recursos de AWS"
  type        = map(string)
}

variable "vpc_cidr_dev" {
    type = string
    default = "10.4.0.0/16"
}
variable "subnet_public_dev" {
  type = string
  default = "10.4.21.0/24"
}