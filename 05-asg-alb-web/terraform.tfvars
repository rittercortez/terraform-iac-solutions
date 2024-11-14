/* regiones = [ "us-east-1","us-east-2" ] */
regiones = {
  "Virginia" = "us-east-1"
  "Ohio" = "us-east-2"
}
network_vpc = {
  vpc_cidr = "10.20.0.0/16"
  subnet_cidr = "10.20.3.0/24"
  sg_egress_cidr = "172.20.0.0/16"
}
