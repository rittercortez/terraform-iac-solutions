# Proyecto 2: Desplegar una Instancia EC2 con Claves SSH

## Contexto del Cliente
Un cliente te ha solicitado configurar una **instancia EC2** para un entorno de desarrollo. Esta instancia se usará para pruebas de software, y el acceso a la máquina debe realizarse mediante claves SSH para garantizar la seguridad. La instancia estará en la subred pública creada en el proyecto anterior y deberá tener una **IP pública** para conectarse desde fuera.

---

## Requerimientos del Cliente

### Instancia EC2:
- El cliente necesita una instancia **EC2** con el sistema operativo **Amazon Linux 2**.
- La instancia debe estar en la **subred pública** creada en el proyecto anterior.
- La instancia debe asignar automáticamente una **IP pública**.

### Par de Claves SSH:
- Crear un **par de claves SSH** para acceder a la instancia.
- El nombre de la clave debe ser **dinámico**, para poder ajustarse en futuros despliegues.

### Grupo de Seguridad (Security Group):
- Crear un **grupo de seguridad** que permita conexiones SSH (puerto 22) desde cualquier dirección IP (por simplicidad, luego se puede mejorar para limitar el acceso).

### Ajustes de la Instancia:
- El tipo de instancia solicitado es **t2.micro** (ya que es para desarrollo y está dentro del **free tier**).
- La instancia debe estar etiquetada correctamente con un nombre que la identifique como **Instancia de Desarrollo**.

---

## Solución Técnica

Este proyecto ha sido implementado utilizando **Terraform** para automatizar la creación de los recursos solicitados, incluyendo la instancia EC2, claves SSH, y el grupo de seguridad. Se han utilizado variables para facilitar la personalización del tipo de instancia y otros parámetros reutilizables.


