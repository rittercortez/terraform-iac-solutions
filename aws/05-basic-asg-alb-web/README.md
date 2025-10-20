# Proyecto 5: Implementación de Auto Scaling y Balanceo de Carga para una Aplicación Web en AWS

## Contexto
Somos una empresa que tiene una **aplicación web** con tráfico variable, dependiendo de la hora del día y de los eventos que gestionamos. Actualmente, el escalado de la infraestructura se realiza de manera manual, lo que resulta ineficiente. El objetivo de este proyecto es automatizar el proceso de escalado y mejorar la gestión del tráfico mediante un **balanceador de carga** en AWS utilizando **Terraform**.

---

## Requerimientos del Proyecto

### 1. VPC y Subnet:
- Crear una **VPC** en AWS con un **CIDR block** adecuado.
- La VPC debe incluir al menos una **subred pública** donde se desplegarán las instancias.

### 2. Security Group:
- Definir un **grupo de seguridad** para las instancias EC2 que permita tráfico **HTTP (puerto 80)** desde cualquier dirección IP.
- Permitir tráfico **SSH (puerto 22)** desde un rango de IPs específico.

### 3. Auto Scaling Group (ASG):
- Implementar un **Auto Scaling Group (ASG)** para gestionar el escalado automático de las instancias EC2.
- El **ASG** debe tener un mínimo de **2 instancias** y un máximo de **5 instancias**, escalando en función del uso de **CPU**.
- Las instancias deben basarse en un **launch configuration** o **launch template** que defina el tipo de instancia y la **imagen de AMI**.

### 4. Elastic Load Balancer (ELB):
- Implementar un **balanceador de carga (ELB)** que distribuya el tráfico entrante a través de las instancias del ASG.
- El **ELB** debe escuchar en el **puerto 80 (HTTP)** y distribuir el tráfico entre las instancias disponibles.

### 5. Escalado basado en Métricas:
- Configurar el **ASG** para que escale en función del uso de **CPU** de las instancias.
- Si la CPU supera el **70%**, el ASG debe lanzar nuevas instancias.
- Si la CPU baja por debajo del **30%**, el ASG debe reducir el número de instancias.

### 6. Outputs:
Al finalizar la ejecución de Terraform, deben mostrarse los siguientes outputs:
- **ID del Auto Scaling Group**.
- **DNS del Elastic Load Balancer (ELB)**.
- **ID de la VPC**.

---

## Solución Técnica

Este proyecto ha sido implementado utilizando **Terraform** para automatizar la creación de la infraestructura requerida, incluyendo el **Auto Scaling Group (ASG)**, el **Elastic Load Balancer (ELB)** y las políticas de escalado basadas en métricas. Las instancias EC2 están diseñadas para escalar automáticamente en función de la carga de CPU, lo que garantiza una gestión eficiente del tráfico entrante.


### Utilize LocalStack para simular el entorno de AWS
 ```bash
    docker run -d -p 4566:4566  localstack/localstack