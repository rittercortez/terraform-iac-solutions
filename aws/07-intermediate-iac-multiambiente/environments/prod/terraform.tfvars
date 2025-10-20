region = "il-central-1" #Israel

#### Configuración de VPC ####
vpc_cidr_prod = "10.66.0.0/16"
vpc_name_prod = "VPC-Lab"


#### Subnet ####
subnet_public_prod = {
  "public-app" = {
    subnet_name      = "Public-App-Subnet"
    subnet_cidr      = "10.66.1.0/24"
    subnet_ip_assign = true
  },
  "public-db" = {
    subnet_name      = "Public-DB-Subnet"
    subnet_cidr      = "10.66.2.0/24"
    subnet_ip_assign = true
  }
}

subnet_private_prod = {
  "private-app" = {
    subnet_name      = "Private-App-Subnet"
    subnet_cidr      = "10.66.3.0/24"
    subnet_ip_assign = false
  },
  "private-db" = {
    subnet_name      = "Private-DB-Subnet"
    subnet_cidr      = "10.66.4.0/24"
    subnet_ip_assign = false
  }
}
igw_name_prod                 = "IGW-Prod"
igw_cidr_block_prod           = "0.0.0.0/0"
ngw_name_prod                 = "NAT-Prod"
route_table_private_name_prod = "RT-Privat"
route_table_public_name_prod  = "RT-Public"


#### Security Group ###
sg_list_port_ingress_prod = [80, 443]
sg_name_prod = "my-security-group"
sg_ip_protocol_prod = "tcp"
default_route_cidr_prod = "0.0.0.0/0"

egress_rules_prod = {
  rule_all = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  },
}

#### Instancia ####
instance_name_prod   = "Server"
instance_type_prod   = "t3.medium"
instance_amount_prod = 1
instance_ami_prod    = "ami-0a1b2c3d4e5f67890" # La AMI de Amazon Linux de la region de Israel
instance_script_prod = "script.sh"
