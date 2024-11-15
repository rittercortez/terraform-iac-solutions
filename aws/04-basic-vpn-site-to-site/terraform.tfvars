regiones = {
  "virginia" = "us-east-1"
  "ohio"     = "us-east-2"
}
vpc_cidr        = ["10.2.0.0/16", "10.40.0.0/16"]
subnet_public   = "10.2.0.0/24"
onpremise_cidr  = ["242.10.29.1", "156.30.0.0/16", "212.54.10.23", "10.20.0.0/16"]
onpremise_ip_gw = "203.0.113.1"
egress_cidr     = "0.0.0.0/0"
tunnel_vpn = {
  "t1_cidr" = "169.254.10.0/30"
  "t2_cidr" = "169.254.11.0/30"
  "key1"    = "key_secret_1"
  "key2"    = "key_secret_2"
}
