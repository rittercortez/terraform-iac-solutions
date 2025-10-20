# Aquí tenemos todo lo relacionado a nuestra VPN Site-to-Site
# Asociamos el Virtual Private Gateway con la VPC
resource "aws_vpn_gateway_attachment" "vpg_vpc" {
  vpc_id         = aws_vpc.vpc_principal.id
  vpn_gateway_id = aws_vpn_gateway.vpg.id
}
resource "aws_vpn_gateway" "vpg" {
  vpc_id = aws_vpc.vpc_principal.id

  tags = {
    Name = "VPG - Principal"
  }
}

# La conexión VPN Site-to-Site
resource "aws_vpn_connection" "vpn_connection" {
  customer_gateway_id = aws_customer_gateway.CGW_on-premise.id
  vpn_gateway_id      = aws_vpn_gateway.vpg.id
  type                = "ipsec.1"

  static_routes_only = false

  tags = {
    Name = "VPN Site-to-Site Pincipal"
  }

  # Configuración del túnel VPN 
  # Aqui tendremos los dos lados del túnel con su rango IP y las claves precompartidas
  # Por si se cae uno tenemos el otro túnel
  tunnel1_inside_cidr   = var.tunnel_vpn.t1_cidr
  tunnel1_preshared_key = var.tunnel_vpn.key2
  tunnel2_inside_cidr   = var.tunnel_vpn.t2_cidr
  tunnel2_preshared_key = var.tunnel_vpn.key2
}
