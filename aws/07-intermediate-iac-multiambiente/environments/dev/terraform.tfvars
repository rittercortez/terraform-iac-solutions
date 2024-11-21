/* region_dev = "us-east-1" */
region = "us-east-1"

#### Configuración de VPC ####
vpc_cidr_dev = "10.33.0.0/16"
vpc_name_dev = "VPC-Lab"


#### Subnet ####
subnet_public_dev = {
  "public-app" = {
    subnet_name      = "Public-App-Subnet"
    subnet_cidr      = "10.33.1.0/24"
    subnet_ip_assign = true
  },
  "public-db" = {
    subnet_name      = "Public-DB-Subnet"
    subnet_cidr      = "10.33.2.0/24"
    subnet_ip_assign = true
  }
}

subnet_private_dev = {
  "private-app" = {
    subnet_name      = "Private-App-Subnet"
    subnet_cidr      = "10.33.3.0/24"
    subnet_ip_assign = false
  },
  "private-db" = {
    subnet_name      = "Private-DB-Subnet"
    subnet_cidr      = "10.33.4.0/24"
    subnet_ip_assign = false
  }
}
igw_name_dev                 = "IGW-Dev"
igw_cidr_block_dev           = "0.0.0.0/0"
ngw_name_dev                 = "NAT-Dev"
route_table_private_name_dev = "RT-Privat"
route_table_public_name_dev  = "RT-Public"


#### Security Group ###
sg_list_port_ingress_dev = [22]
sg_name_dev = "my-security-group"
sg_ip_protocol_dev = "tcp"
default_route_cidr_dev = "0.0.0.0/0"

egress_rules_dev = {
  rule_all = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  },
}

#### Instancia ####
instance_name_dev   = "Server"
instance_type_dev   = "t2.micro"
instance_amount_dev = 2
instance_ami_dev    = "ami-0e593d2b811299b15"
instance_script_dev = "script.sh"
