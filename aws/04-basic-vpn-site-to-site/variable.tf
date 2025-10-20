variable "regiones" {
  description = "Regiones de AWS"
  type        = map(string)
}
variable "vpc_cidr" {
  description = "Rango de CIDR para la VPC"
  type        = list(string)

}
variable "subnet_public" {
  description = "Rango de CIDR para la subred pública"
  type        = string
}
variable "onpremise_ip_gw" {
  description = "Simulación de IP pública OnPremise"
  type        = string
}
variable "onpremise_cidr" {
  description = "CIDR de on-premise "
  type        = list(string)
}
variable "egress_cidr" {
  description = "CIDR que permite todo el tráfico saliente"
  type        = string
}
variable "tunnel_vpn" {
  description = "Configuración del túnel VPN rango IP y clave"
  type        = map(string)
}
