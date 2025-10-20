# Provider AWS y simularemos todo en el contenedor de Local-Stack
terraform {
  required_providers {
    aws = {
      version = "~>5.0"
      source  = "hashicorp/aws"
    }
  }
}

# Contenedor LocalStack
provider "aws" {
  region                      = var.region
  access_key                  = var.access_secret_key
  secret_key                  = var.access_secret_key
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  default_tags {
    tags = {
      Owner     = var.tags["Owner"]
      ManagedBy = var.tags["ManagedBy"]
      Version   = var.tags["Version"]
    }
  }
  endpoints {
    ec2 = "http://172.17.0.2:4566"
  }
}
