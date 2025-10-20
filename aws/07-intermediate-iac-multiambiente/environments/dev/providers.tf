terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Entorno localstack 
provider "aws" {
  region                      = var.region
  access_key                  = local.localstack_accesskey
  secret_key                  = local.localstack_secretkey
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true # Desactiva la verificación del ID de cuenta
  default_tags {
    tags = {
      Owner       = local.Owner
      ManagedBy   = local.ManagedBy
      Version     = local.Version
      Environment = var.environment
    }
  }
  endpoints {
    ec2 = local.localstack_container
    elbv2 = local.localstack_container
  }
}
