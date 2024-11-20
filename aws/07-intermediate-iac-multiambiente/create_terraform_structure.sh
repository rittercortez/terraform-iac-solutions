#!/bin/bash

# Directorio raíz
ROOT_DIR="07-iac-multiambiente"

# Crear carpetas principales
mkdir -p "$ROOT_DIR/environments/dev"
mkdir -p "$ROOT_DIR/environments/prod"
mkdir -p "$ROOT_DIR/environments/test"
mkdir -p "$ROOT_DIR/modules/elb"
mkdir -p "$ROOT_DIR/modules/instance"
mkdir -p "$ROOT_DIR/modules/security_group"
mkdir -p "$ROOT_DIR/modules/subnet"
mkdir -p "$ROOT_DIR/modules/vpc"

# Crear archivos en environments/dev
touch "$ROOT_DIR/environments/dev/main.tf"
touch "$ROOT_DIR/environments/dev/terraform.tfvars"
touch "$ROOT_DIR/environments/dev/variable.tf"

# Crear archivos en environments/prod
touch "$ROOT_DIR/environments/prod/main.tf"
touch "$ROOT_DIR/environments/prod/terraform.tfvars"
touch "$ROOT_DIR/environments/prod/variables.tf"

# Crear archivos en environments/test
touch "$ROOT_DIR/environments/test/main.tf"
touch "$ROOT_DIR/environments/test/terraform.tfvars"
touch "$ROOT_DIR/environments/test/variable.tf"

# Crear archivos en modules/elb
touch "$ROOT_DIR/modules/elb/main.tf"
touch "$ROOT_DIR/modules/elb/outputs.tf"
touch "$ROOT_DIR/modules/elb/variable.tf"

# Crear archivos en modules/instance
touch "$ROOT_DIR/modules/instance/main.tf"
touch "$ROOT_DIR/modules/instance/outputs.tf"
touch "$ROOT_DIR/modules/instance/variable.tf"

# Crear archivos en modules/security_group
touch "$ROOT_DIR/modules/security_group/main.tf"
touch "$ROOT_DIR/modules/security_group/outputs.tf"
touch "$ROOT_DIR/modules/security_group/variable.tf"

# Crear archivos en modules/subnet
touch "$ROOT_DIR/modules/subnet/main.tf"
touch "$ROOT_DIR/modules/subnet/outputs.tf"
touch "$ROOT_DIR/modules/subnet/variable.tf"

# Crear archivos en modules/vpc
touch "$ROOT_DIR/modules/vpc/main.tf"
touch "$ROOT_DIR/modules/vpc/outputs.tf"
touch "$ROOT_DIR/modules/vpc/variable.tf"

# Crear archivos en raíz
touch "$ROOT_DIR/providers.tf"
touch "$ROOT_DIR/variables.tf"
touch "$ROOT_DIR/README.md"


