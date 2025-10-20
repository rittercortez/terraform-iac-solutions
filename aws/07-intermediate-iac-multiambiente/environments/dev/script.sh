#!/bin/bash

# Instalar curl si no está presente
if ! command -v curl &> /dev/null; then
  sudo apt-get update && sudo apt-get install -y curl
fi

# Instalar NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

# Exportar variables de entorno para NVM (asegurar que esté disponible en la sesión actual)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # Cargar NVM
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # Cargar autocompletado

# Instalar Node.js versión 22
nvm install 22

