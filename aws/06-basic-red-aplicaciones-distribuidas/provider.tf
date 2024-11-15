terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
# Contenedor de Local-Stack para simular el entorno AWS
provider "aws" {
  region                      = var.regiones.virginia
  access_key                  = var.env_localstack.localstack_accesskey
  secret_key                  = var.env_localstack.localstack_secretkey
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true  # Desactiva la verificación del ID de cuenta
  default_tags {
    tags = {
      Owner       = var.tags.Owner
      Environment = var.tags.Environment
    }
  }
  endpoints {
    ec2 = "http://localhost:4566"
  }
}
