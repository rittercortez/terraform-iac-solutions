# Proyecto 1: Implementación de VPC con Subred Pública y Tabla de Rutas

## Contexto del Cliente
Una empresa está expandiendo su infraestructura en AWS y te han contratado para implementar una **Virtual Private Cloud (VPC)** con una subred pública que pueda conectarse a Internet. Este es un paso inicial para preparar la infraestructura donde se desplegarán otros recursos.

---

## Requerimientos del Cliente

### VPC:
- Crear una **VPC** con el rango CIDR `10.0.0.0/16`.
- La VPC debe ser nominada adecuadamente para su fácil identificación en la consola de AWS (Ej: `"Main-VPC"`).

### Subred Pública:
- Crear una **subred pública** dentro de la VPC con el rango CIDR `10.0.1.0/24`.
- La subred debe estar localizada en la zona de disponibilidad `us-west-2a`.
- La subred debe estar correctamente etiquetada (Ej: `"Public-Subnet"`).

### Internet Gateway:
- La **subred pública** necesita acceso a Internet, por lo que debes crear un **Internet Gateway** y asociarlo con la VPC.

### Tabla de Rutas:
- Crear una **tabla de rutas** que permita la salida a Internet desde la subred pública.
- La tabla de rutas debe tener una ruta para el tráfico `0.0.0.0/0` y estar asociada con el **Internet Gateway** creado previamente.

### Asociación de la Tabla de Rutas:
- Asociar la **tabla de rutas** a la subred pública para permitir que enrute tráfico hacia el **Internet Gateway**.

---

## Solución Técnica

Este proyecto ha sido implementado utilizando **Terraform** para automatizar la creación de los recursos mencionados. Los scripts incluyen la configuración de la VPC, subred, Internet Gateway, y la tabla de rutas, con el uso de variables para facilitar su reutilización y adaptabilidad.

![image](https://github.com/user-attachments/assets/82af218f-2ecf-43fc-b439-03f1ef4ac344)

