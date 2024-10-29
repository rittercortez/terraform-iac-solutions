# Aqui estará los servicios simulando nuestro entorno On-premise
# Simulamos el gateway de una empresa
resource "aws_customer_gateway" "CGW_on-premise" {
  bgp_asn    = 65000
  ip_address = var.onpremise_ip_gw
  type       = "ipsec.1"

  tags = {
    Name = "CGW - On-Premise"
  }
}
# Ruta estática simulando la red On-Premise
resource "aws_vpn_connection_route" "route_to_onprem" {
  vpn_connection_id      = aws_vpn_connection.vpn_connection.id
  destination_cidr_block = var.onpremise_cidr[3]
}
