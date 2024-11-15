# VPC
resource "aws_vpc" "VPC-ohio" {
  cidr_block = var.vpc_cidr
  tags =  {
    Name = " VPC  Ohio"
  }
}

# Subred pública
resource "aws_subnet" "subnet_public" {
  vpc_id     = aws_vpc.VPC-ohio.id
  cidr_block = var.subnetPublic_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet"
  }
}

# Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.VPC-ohio.id
  tags = {
    Name = "gw-ohio"
  }
}

# Tabla de enrutamiento
resource "aws_route_table" "rt-table" {
  vpc_id = aws_vpc.VPC-ohio.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "RT - Table"
  }
}
resource "aws_route_table_association" "rt-association" {
  subnet_id      = aws_subnet.subnet_public.id
  route_table_id = aws_route_table.rt-table.id
}
