# Proyecto 7: Implementación de Infraestructura Multiambiente (Desarrollo, Pruebas y Producción) en AWS

## Contexto
Tu cliente es una empresa en expansión que quiere optimizar la gestión de sus recursos en la nube y necesita configurar tres ambientes: **Desarrollo**, **Pruebas** y **Producción**. Cada ambiente debe estar aislado, pero debe seguir una estructura común para facilitar el mantenimiento y la escalabilidad. La solución debe ser **flexible** y **escalable** en AWS, utilizando **Terraform** para gestionar el despliegue de los recursos.

---

## Objetivo Principal
Crear una infraestructura en AWS que soporte tres ambientes separados (Desarrollo, Pruebas y Producción), con configuraciones personalizadas y variables específicas para cada uno. Este proyecto se centra en la reutilización de código mediante módulos de Terraform y configuraciones adaptables.

---

## Requerimientos Específicos

### 1. Configuración de la VPC y Subredes
- Crear un **módulo de VPC** que permita definir una **VPC** con subredes públicas y privadas.
- Cada ambiente debe tener su propia **VPC** con un rango de **CIDR** específico, configurable a través de variables.
- Permitir la creación de subredes públicas o privadas según el ambiente.

### 2. Grupos de Seguridad (Security Groups)
- Configurar un **módulo de Security Group** para definir las reglas de entrada y salida.
- Las reglas de tráfico deben ser específicas para cada ambiente:
  - Permitir tráfico **SSH (puerto 22)** solo en el ambiente de **Desarrollo**.
  - Permitir tráfico **HTTP (puerto 80)** y **HTTPS (puerto 443)** en los ambientes de **Pruebas** y **Producción**.
- Utilizar `for_each` para crear reglas de seguridad personalizadas para cada ambiente.

### 3. Instancias EC2
- Crear un **módulo de EC2** que despliegue instancias según el ambiente. La cantidad y tipo de instancias deben ser configurables.
- La instancia de **Desarrollo** debe tener un tamaño pequeño (por ejemplo, **t2.micro**), mientras que las instancias de **Producción** pueden usar un tamaño superior (por ejemplo, **t3.medium**).
- Configurar **provisioners** para que cada instancia ejecute un script de inicialización específico para su ambiente.

### 4. Balanceador de Carga (Opcional) 
- Implementar un **Load Balancer** solo en el ambiente de **Producción**, utilizando un bloque condicional para controlar su creación.
- Asociar el Load Balancer a un **grupo de destino** que incluya las instancias EC2 de Producción. 
  
  ** Cree el requerimiento pero no lo implementé  ya que LocalStack en su versión gratuita no lo permite**

### 5. Variables y Configuraciones de Entrada
- Definir variables para el rango **CIDR** de cada ambiente, el tipo de instancias y la cantidad de instancias por ambiente.
- Crear **variables booleanas** que permitan activar o desactivar recursos específicos (como el Load Balancer) según el ambiente.

### 6. Outputs
Al finalizar la ejecución de Terraform, deben mostrarse los siguientes outputs:
- **IDs de las VPCs** y subredes de cada ambiente.
- **IDs de las instancias EC2** y, en el caso de **Producción**
- **Reglas de entrada de los grupos de seguridad** para verificar que se han aplicado correctamente.

---

## Detalles Técnicos y Buenas Prácticas

- **Módulos**: Utilizar módulos para **VPC**, **EC2** y **Security Groups**. Cada módulo debe aceptar variables de entrada para personalizar su configuración según el ambiente.
- **Condicionales**: Utilizar condicionales para activar o desactivar recursos según el ambiente.
- **Provisioners**: Implementar **provisioners** para ejecutar scripts de inicialización específicos por ambiente.
- **Reutilización de Código**: Asegurarse de que los módulos son reutilizables y siguen una estructura consistente para facilitar su mantenimiento.

---

# Entorno de trabajo

- **Sistema operativo**: Linux (WSL2 - Windows Subsystem for Linux)
- **Simulación de servicios AWS**: LocalStack
- **Gestión de infraestructura**: Terraform

### Requerimientos previos

1. **Instalar Docker**: Asegúrate de tener Docker Desktop instalado y corriendo en WSL2.
2. **Instalar Terraform**: Descarga e instala Terraform desde [HashiCorp Terraform](https://www.terraform.io/downloads).
3. **Habilitar WSL2**: El entorno se está ejecutando en un subsistema Linux (WSL2). Asegúrate de que tu distribución de Linux esté configurada correctamente.
4. **Script para estructura de carpetas**: dejo un script en bash para crear la estructura de carpetas y archivos. 
    - El archivo es: "create_terraform_structure.sh"

## Instrucciones para levantar el entorno

### 1. Configuración de LocalStack

LocalStack simula servicios de AWS, como S3, EC2, VPC, etc. Para usarlo, sigue estos pasos:

#### a) Ejecutar LocalStack con Docker
Usa el siguiente comando para levantar LocalStack en un contenedor de Docker:

```bash
docker run -d -p 4066:4066  --name localstack localstack/localstack
```

#### b) Verificar el contenedor y obtener su IP
Para obtener la IP del contenedor de LocalStack, usa el siguiente comando:

```bash
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' localstack
```

#### c) Reemplazar la IP en archivo "vairables_global.tf"
El en archivo "variables_global.tf" remplazaremos la ip de "localstack_container"

#### Posibles errores
- Si encuentras errores de puertos ya asignados, verifica qué puertos están ocupados usando:

``` bash
 netstat -tuln | grep 4066
```

---

