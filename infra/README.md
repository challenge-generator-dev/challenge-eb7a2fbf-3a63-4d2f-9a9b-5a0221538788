# Infraestructura AWS para el Servicio de Órdenes

Este módulo de Terraform aprovisiona los recursos de infraestructura necesarios para desplegar el servicio de órdenes en AWS.

## Recursos Definidos

El módulo crea y gestiona los siguientes recursos:

- **Amazon ECS**: Servicio de contenedores para ejecutar la aplicación
- **Amazon RDS (PostgreSQL)**: Base de datos relacional para persistencia
- **Amazon VPC**: Red virtual privada para aislamiento
- **AWS Application Load Balancer**: Balanceador de carga para distribución de tráfico
- **Security Groups**: Grupos de seguridad para controlar acceso a recursos
- **IAM Roles**: Roles y políticas para permisos de ECS y tareas

## Estructura del Proyecto

```
.
├── versions.tf              # Versiones de Terraform y providers
├── main.tf                  # Definición del provider y módulos
├── providers.tf             # Configuración de proveedores
├── variables.tf             # Variables de entrada del root
├── outputs.tf               # Outputs del root
├── environments/
│   ├── dev/
│   │   ├── main.tf          # Configuración del entorno dev
│   │   ├── variables.tf     # Variables específicas de dev
│   │   └── terraform.tfvars # Valores para dev
│   └── prod/
│       ├── main.tf          # Configuración del entorno prod
│       ├── variables.tf     # Variables específicas de prod
│       └── terraform.tfvars # Valores para prod
└── modules/
    └── orders-service/
        ├── main.tf          # Recursos del servicio
        ├── variables.tf     # Variables del módulo
        └── outputs.tf       # Outputs del módulo
```

## Validación Local

Para validar la configuración de Terraform en tu máquina local:

1. **Instalar Terraform** (versión >= 1.0):
   ```bash
   brew install terraform
   # o descarga desde https://www.terraform.io/downloads
   ```

2. **Inicializar Terraform**:
   ```bash
   cd environments/dev
   terraform init
   ```

3. **Validar sintaxis y formato**:
   ```bash
   terraform validate
   ```

4. **Verificar el plan de ejecución**:
   ```bash
   terraform plan
   ```

5. **Aplicar los cambios** (cuidado, crea recursos reales):
   ```bash
   terraform apply
   ```

## Requisitos Previos

- Cuenta de AWS con permisos para crear los recursos
- Credenciales de AWS configuradas (variables de entorno, archivo de credenciales o perfil)
- Terraform CLI instalado

## Variables Requeridas

Las variables principales que deben definirse antes de aplicar:

| Variable | Descripción | Ejemplo |
|----------|-------------|----------|
| `aws_region` | Región de AWS | `us-east-1` |
| `environment` | Nombre del entorno | `dev`, `prod` |
| `vpc_id` | ID de la VPC existente | `vpc-12345678` |
| `subnet_ids` | IDs de las subnets | `["subnet-1", "subnet-2"]` |
| `container_image` | Imagen del contenedor | `orders-service:latest` |

## Outputs

El módulo expone información útil sobre los recursos creados:

- ID del servicio ECS
- Endpoint del Application Load Balancer
- Endpoint de la base de datos RDS
- ARN del servicio ECS

## Limpieza

Para destruir los recursos creados (cuidado, esto elimina todo):

```bash
terraform destroy
```

## Notas de Seguridad

- Nunca almacenes contraseñas o claves en el código fuente
- Usa AWS Secrets Manager para gestionar secretos
- Configura restricciones de acceso mediante IAM policies
- Habilita cifrado en reposo para RDS y en tránsito para ALB