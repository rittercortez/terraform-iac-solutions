# Proyecto 4: Levantar una VPN en AWS utilizando Terraform

## Contexto
Esta prueba técnica ha sido solicitada como parte de un proceso de entrevista para el puesto de **SysAdmin AWS**. El objetivo es desplegar una **VPN en AWS** utilizando **Terraform**, demostrando la capacidad de manejar la infraestructura de AWS de manera eficiente y con buenas prácticas.

---

## Requerimientos del Proyecto

### Levantar una VPN en AWS:
- Implementar una **VPN** que permita la conexión segura entre una red **on-premise simulada** (o un entorno local) y una **VPC** en AWS.

### VPC:
- La **VPN** debe estar asociada a una **VPC** en AWS, que será creada como parte de este proyecto.
- La **VPC** debe incluir al menos **una subred pública**.

### Customer Gateway (CGW):
- Crear y configurar un **Customer Gateway (CGW)** que represente el gateway del entorno on-premise.
- Definir la **IP pública** del CGW simulada.

### Virtual Private Gateway (VGW):
- Implementar un **Virtual Private Gateway (VGW)** en AWS, para conectar la VPC con la VPN.

### Configurar la Conexión VPN:
- Crear una conexión **VPN Site-to-Site** que establezca el enlace seguro entre la VPC y el Customer Gateway.
- Definir correctamente las **rutas** para la comunicación entre las subredes de la VPC y la red simulada.

### Seguridad:
- Implementar **grupos de seguridad** que permitan solo el tráfico necesario para la VPN.
- Asegurarse de que las **políticas de acceso** son apropiadas y la comunicación es segura.

### Simplicidad:
- La solución debe ser **simple y clara**. Se valorará la correcta utilización de **Terraform** y la implementación efectiva.

---

## Solución Técnica

Este proyecto ha sido implementado utilizando **Terraform** para automatizar la creación de la **VPN**, la **VPC**, el **Customer Gateway** y el **Virtual Private Gateway**. Además, se han configurado las rutas necesarias para el tráfico seguro entre las redes.

