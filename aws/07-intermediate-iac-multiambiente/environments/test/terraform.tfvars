region = "ap-northeast-1" # Asia Pacífico - Tokio

#### Configuración de VPC ####
vpc_cidr_test = "10.99.0.0/16"
vpc_name_test = "VPC-Lab"


#### Subnet ####
subnet_public_test = {
  "public-app" = {
    subnet_name      = "Public-App-Subnet"
    subnet_cidr      = "10.99.1.0/24"
    subnet_ip_assign = true
  },
  "public-db" = {
    subnet_name      = "Public-DB-Subnet"
    subnet_cidr      = "10.99.2.0/24"
    subnet_ip_assign = true
  }
}

subnet_private_test = {
  "private-app" = {
    subnet_name      = "Private-App-Subnet"
    subnet_cidr      = "10.99.3.0/24"
    subnet_ip_assign = false
  },
  "private-db" = {
    subnet_name      = "Private-DB-Subnet"
    subnet_cidr      = "10.99.4.0/24"
    subnet_ip_assign = false
  }
}
igw_name_test                 = "IGW-test"
igw_cidr_block_test           = "0.0.0.0/0"
ngw_name_test                 = "NAT-test"
route_table_private_name_test = "RT-Privat"
route_table_public_name_test  = "RT-Public"


#### Security Group ###

sg_list_port_ingress_test = [2375, 6443] # Docker y Kubernetes
sg_name_test = "my-security-group"
sg_ip_protocol_test = "tcp"
default_route_cidr_test = "0.0.0.0/0"

egress_rules_test = {
  rule_all = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  },
}

#### Instancia ####
instance_name_test   = "Server"
instance_type_test   = "m6g.medium"
instance_amount_test = 5
instance_ami_test    = "ami-06cd52961ce9f0d85" # Asia Pacífico - Tokio
instance_script_test = "script.sh"
