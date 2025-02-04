# Proyecto 6: Configuración de Red en AWS para Aplicación Distribuida

## Descripción del Proyecto
Somos una empresa de tecnología que desarrolla **aplicaciones distribuidas** con requisitos de alta disponibilidad y escalabilidad. Para el despliegue de nuestro nuevo sistema, necesitamos una **infraestructura de red sólida en AWS**. Este entorno debe incluir subredes segmentadas para servicios públicos y privados, con configuraciones de seguridad específicas para cada segmento.

---

## Objetivo Principal
El objetivo es crear una infraestructura de red en AWS utilizando **Terraform** que cumpla con los siguientes criterios:

- **Configuraci
ón flexible**: Las subredes deben poder ajustarse en número y tipo (públicas o privadas) mediante variables de configuración.
- **Alta disponibilidad**: Subredes desplegadas en al menos dos **zonas de disponibilidad** (Availability Zones).
- **Seguridad**: Grupos de seguridad que controlen el acceso externo e interno según el tipo de servicio en cada subred.

---

## Requerimientos Específicos

### VPC y Subredes:
- **VPC**:
  - Crear una **VPC** en AWS con un rango **CIDR** que pueda soportar múltiples subredes.

- **Subredes Públicas**:
  - Utilizar `count` para definir una cantidad variable de subredes públicas según una variable de entrada (`num_subnet_public`).
  - Estas subredes deben estar conectadas a un **Internet Gateway**.

- **Subredes Privadas**:
  - Usar `for_each` para crear varias subredes privadas, con un número y direcciones CIDR específicas definidas en una variable de tipo **map**.
  - Las subredes privadas deben tener acceso a Internet a través de un **NAT Gateway** (opcional) si su tráfico lo requiere.

### Tablas de Rutas y Puertas de Enlace:
- **Internet Gateway**: Configura un Internet Gateway y asócialo con las subredes públicas.
- **NAT Gateway (opcional)**: Configura un NAT Gateway que permita a las subredes privadas acceder a Internet.
- **Tablas de rutas**:
  - Crear una tabla de rutas para las subredes públicas que dirija el tráfico a través del Internet Gateway.
  - Crear una tabla de rutas separada para las subredes privadas, dirigida al NAT Gateway si está configurado.

### Security Groups:
- Configura dos tipos de **Security Groups** con `for_each`:
  - **Security Group Público**:
    - Permite tráfico HTTP (puerto 80) y HTTPS (puerto 443) desde cualquier IP.
    - Permite acceso SSH (puerto 22) solo desde un rango de IPs específico.
  - **Security Group Privado**:
    - Solo permite acceso dentro de la VPC y habilita puertos específicos necesarios para servicios internos.

### Variables y Configuraciones de Entrada:
- **Variables de entrada**:
  - Define variables para el rango CIDR de la VPC, el número de subredes públicas, y un **map** para las subredes privadas con sus rangos CIDR.
  - Usa una variable **booleana** opcional para decidir si se implementa un NAT Gateway.
- **Condicionales**: Usa condicionales para permitir o denegar el acceso de Internet a las subredes según su tipo.
- **Locals**: Utiliza `locals` para definir etiquetas comunes de nombre, como el entorno (`dev`, `prod`) y el propietario, para aplicarlas a todos los recursos.

---

## Outputs Requeridos
Al finalizar la ejecución de Terraform, deben mostrarse los siguientes outputs:

- **IDs de todas las subredes públicas y privadas**.
- **ID del Internet Gateway**.
- (Opcional) **ID del NAT Gateway** si está configurado.
- **CIDRs asignados a cada subred**.

---

## Aspectos Técnicos y Buenas Prácticas

Para este proyecto, se han implementado técnicas avanzadas de Terraform:

- **Count y For_each**: `count` en las subredes públicas para hacer su creación dinámica en función de la variable de entrada, y `for_each` en las subredes privadas para configurar rangos específicos de CIDR.
- **Condicionales y locals**: Uso de condicionales para configurar rutas de manera flexible y `locals` para etiquetas que aseguren consistencia en la nomenclatura de recursos.
- **Reutilización de Código**: Se han agrupado configuraciones en módulos donde es posible, para facilitar su reuso en otros entornos.

---
Utilize LocalStack para simular el entorno de AWS
´´´bash
 docker run -p 4566:4566 -p 4571:4571 localstack/localstack
