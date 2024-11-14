# VPC
resource "aws_vpc" "vpc_principal" {
  cidr_block = var.network_vpc.vpc_cidr
  tags = {
    Name = "VPC - Principal"
  }
}
# Subred conectada con nuestra VPC que asigna IPs dinámicamente y deepende de la creación de la VPC
resource "aws_subnet" "subnet_public" {
  vpc_id = aws_vpc.vpc_principal.id
  cidr_block = var.network_vpc.subnet_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet Public"
  }
}

# Internet Gateway conectado a nuestra VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_principal.id
  tags = {
    Name = "igw-principal"
  }
}

# Tabla de enrutamiento conectada a la VPC 
resource "aws_route_table" "rt_principal" {
  vpc_id = aws_vpc.vpc_principal.id
  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "rt-principal"
  }
}
# Asociamos nuestra tabla de enrutamiento a la subred
resource "aws_route_table_association" "rt_igw_subnet" {
  route_table_id = aws_route_table.rt_principal.id
  subnet_id = aws_subnet.subnet_public.id
}

