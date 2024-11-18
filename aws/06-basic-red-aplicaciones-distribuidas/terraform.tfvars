env_localstack = {
  localstack_accesskey = "test"
  localstack_secretkey = "test"
}
regiones = {
  "virginia" = "us-east-1"
  "ohio"     = "us-east-2"
}

vpc = "10.2.0.0/16"
subnet_flex = {
  num_subnet_public = ["10.2.30.0/24", "10.2.40.0/24", "10.2.50.0/24"]
  num_subnet_private = {
    "1" = "10.2.60.0/24"
    "2" = "10.2.70.0/24"
    "3" = "10.2.80.0/24"
    "4" = "10.2.90.0/24"
  }
}

security_group = {
  ingress_list_port = [80, 443]
  all_ip_access     = "0.0.0.0/0"
  cidr_ssh          = "30.120.4.0/24"
}
nat_gw            = true
igw_deny_or_allow = "allow"
ec2 = {
  ami          = "ami-0ff8a91507f77f867" # AMI de Virginia
  type_intance = "t2.micro"
}
tags = {
  Name        = "proyecto"
  Environment = "dev"
  Owner       = "Soy Ritter"
}
