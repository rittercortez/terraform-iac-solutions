terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
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
  endpoints {
    s3 = "http://172.17.0.2:4566"
  }
}




