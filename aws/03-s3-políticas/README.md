# Proyecto 3: Crear un Bucket S3 con Políticas de Acceso Restringido

## Contexto del Cliente
El cliente necesita almacenar archivos de manera segura en un **bucket S3** en AWS. El bucket debe ser de acceso restringido para evitar que los archivos sean accesibles de manera pública. Se requiere que los archivos solo puedan ser accedidos por usuarios o servicios autorizados.

---

## Requerimientos del Cliente

### Bucket S3:
- Crear un **bucket S3** con un nombre único (puedes usar un sufijo aleatorio para garantizar que no se repita).
- El bucket debe estar correctamente etiquetado para identificar su entorno (desarrollo, producción, etc.).

### Política de Acceso Restringido:
- Crear una **política de acceso** que restrinja el acceso al bucket.
- Solo los **usuarios o roles de IAM** específicos deben poder leer y escribir en el bucket.
- La política debe **bloquear cualquier acceso público**.

### Versionado de Objetos:
- Habilitar el **versionado** en el bucket S3 para que los objetos puedan mantener versiones anteriores.

### Registro de Acceso (Logging):
- Habilitar el **registro de acceso (logging)** para el bucket.
- Los **logs de acceso** deben almacenarse en otro bucket S3 que el cliente tiene designado.

---

## Solución Técnica

Este proyecto ha sido implementado utilizando **Terraform** para automatizar la creación del bucket S3, la política de acceso, el versionado de objetos y el registro de acceso. Se han utilizado variables para personalizar parámetros reutilizables como el nombre del bucket y los roles de IAM autorizados.

