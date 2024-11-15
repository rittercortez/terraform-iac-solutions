variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "tags" {
  description = "Tags for the S3 bucket"
  type        = map(string)
}
variable "region" {
  type    = string
  default = "us-east-1"
}
variable "access_secret_key" {
  type    = string
  default = "test"
}
locals {
  environment = "Dev"
  managedBy   = "Terraform"
}