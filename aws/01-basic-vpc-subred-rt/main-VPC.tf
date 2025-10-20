provider "aws" {
  region = "us-east-2"
  alias = "ohio"
}

resource "aws_vpc" "VPC-ohio" {
  cidr_block = var.vpc_cidr
  tags =  {
    Name = " VPC  Ohio"
  }
}

# Subnet Público
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

# Tabla de rutas
resource "aws_route_table" "rt-table" {
  vpc_id = aws_vpc.VPC-ohio.id

  route {
    cidr_block = var.RTtable_cidr
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
