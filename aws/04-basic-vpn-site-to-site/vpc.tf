# VPC principal donde conectaremos todo simulando nuestra red en AWS
resource "aws_vpc" "vpc_principal" {
  cidr_block = var.vpc_cidr[0]
}
# Subred pública
resource "aws_subnet" "subnet_public" {
  vpc_id     = aws_vpc.vpc_principal.id
  cidr_block = var.subnet_public

  # Esto lo puse para simular que queremos conectar instancias ya que genera las IPs públicas
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet"
  }
}
# La tabla de enrutamiento conectada a la subred
resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.vpc_principal.id

  tags = {
    Name = "Tabla de enrutamiento Pública"
  }
}
resource "aws_route_table_association" "rta_public" {
  subnet_id      = aws_subnet.subnet_public.id
  route_table_id = aws_route_table.rt_public.id
}

# Enrutamiento hacia la red simulada (on-premise) a través del VPG
resource "aws_route" "rt_to_onprem" {
  route_table_id         = aws_route_table.rt_public.id
  destination_cidr_block = var.onpremise_cidr[3] # Red on-premise simulada
  gateway_id             = aws_vpn_gateway.vpg.id
}
