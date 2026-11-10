# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `infra/versions.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/orders-service/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/orders-service/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/orders-service/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/dev/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/dev/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/prod/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/prod/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Mapa de componentes

El repo tiene una carpeta por componente. Cada uno se instala y verifica dentro de la suya.

| Componente | Carpeta | Rol | Capa | Track | Tecnologias |
|---|---|---|---|---|---|
| `infra` | `infra/` | practice | infra | Terraform (AWS) | Terraform |
| `api` | `api/` | chapter, support | server | Java | - |

## Orden de arranque

1. `cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate` — componente `infra` (practice).
2. `cd api && mvn clean compile` — componente `api` (chapter, support).

### Contratos entre componentes

- `api` expone http (api: http://localhost:8080):
  - `POST /api/orders`
  - `GET /api/orders/{id}`
  - `PUT /api/orders/{id}`
  - `DELETE /api/orders/{id}`

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).
- **Java**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Lo que le falta a este proyecto

Esto NO lo tenes que adivinar: salio de comparar el proyecto contra la arquitectura declarada del reto y de un analisis estatico del codigo. Completalo TODO.

### Referencias colgando en el codigo que si esta

Cada una rompe la compilacion:

- `api/src/main/java/com/orders/api/infrastructure/persistence/OrderJpaRepository.java` — `Order.getItems`: Se invoca `getItems` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `Order.setId`: Se invoca `setId` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `Order.setCustomerId`: Se invoca `setCustomerId` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `OrderRequestDTO.customerId`: Se invoca `customerId` sobre `OrderRequestDTO`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `Order.setStatus`: Se invoca `setStatus` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `Order.setCreatedAt`: Se invoca `setCreatedAt` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `Order.setUpdatedAt`: Se invoca `setUpdatedAt` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `OrderRequestDTO.items`: Se invoca `items` sobre `OrderRequestDTO`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `OrderItem.setProductId`: Se invoca `setProductId` sobre `OrderItem`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `OrderItem.setQuantity`: Se invoca `setQuantity` sobre `OrderItem`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `OrderItem.setUnitPrice`: Se invoca `setUnitPrice` sobre `OrderItem`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `Order.setItems`: Se invoca `setItems` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `Order.getStatus`: Se invoca `getStatus` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `Order.isEmpty`: Se invoca `isEmpty` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `Order.get`: Se invoca `get` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `OrderItem.productId`: Se invoca `productId` sobre `OrderItem`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `OrderItem.quantity`: Se invoca `quantity` sobre `OrderItem`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `OrderItem.unitPrice`: Se invoca `unitPrice` sobre `OrderItem`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `Order.getItems`: Se invoca `getItems` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `OrderItem.getProductId`: Se invoca `getProductId` sobre `OrderItem`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `OrderItem.getQuantity`: Se invoca `getQuantity` sobre `OrderItem`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `OrderItem.getUnitPrice`: Se invoca `getUnitPrice` sobre `OrderItem`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `Order.getId`: Se invoca `getId` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `Order.getCustomerId`: Se invoca `getCustomerId` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `Order.getCreatedAt`: Se invoca `getCreatedAt` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `Order.getUpdatedAt`: Se invoca `getUpdatedAt` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `Order.getTotalAmount`: Se invoca `getTotalAmount` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.

## Como saber que terminaste

```bash
(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd api && mvn clean compile)
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Backend, Especialidad Desarrollador, Tecnología Java, Senior L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform (corrida e2e 20261109193147506), Aprovisiona con Terraform la infraestructura AWS que necesita el servicio de ordenes

### Misión / candidato
Versionar la infraestructura del servicio

### Reto
- Tema: Infraestructura como codigo para el servicio de ordenes
- Seniority: senior-l2
- Tipo: practical
- Título: Aprovisionamiento de Infraestructura con Terraform para el Servicio de Órdenes
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración Inicial de Terraform — objetivo: Configurar el entorno de Terraform para el aprovisionamiento de la infraestructura AWS. — entregable (NO resolver): Archivo principal de Terraform configurado y variables definidas.
- Fase 2: Definición de Recursos de Infraestructura — objetivo: Definir los recursos de infraestructura necesarios en Terraform. — entregable (NO resolver): Recursos de infraestructura definidos en Terraform.
- Fase 3: Despliegue y Verificación de la Infraestructura — objetivo: Desplegar la infraestructura definida en Terraform y verificar su correcto funcionamiento. — entregable (NO resolver): Infraestructura desplegada y verificada.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: infra/providers.tf ===
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.65.0"
    }
  }
  required_version = ">= 1.9.0"
}

provider "aws" {
  region = var.aws_region
}

// === ARCHIVO: infra/variables.tf ===
variable "aws_region" {
  description = "Región de AWS donde se desplegará la infraestructura"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Entorno de despliegue (dev, prod, etc.)"
  type        = string
  default     = "dev"
}

variable "service_name" {
  description = "Nombre del servicio al que pertenece la infraestructura"
  type        = string
  default     = "orders-service"
}

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC del servicio"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subnets públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subnets privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "db_username" {
  description = "Nombre de usuario para la base de datos"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Contraseña para la base de datos"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "Clase de instancia para la base de datos"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Almacenamiento asignado para la base de datos en GB"
  type        = number
  default     = 20
}

variable "ecs_task_cpu" {
  description = "CPU asignada para la tarea de ECS"
  type        = number
  default     = 256
}

variable "ecs_task_memory" {
  description = "Memoria asignada para la tarea de ECS en MB"
  type        = number
  default     = 512
}

variable "ecs_desired_count" {
  description = "Número deseado de tareas de ECS en ejecución"
  type        = number
  default     = 1
}

variable "ecr_repository_name" {
  description = "Nombre del repositorio ECR para las imágenes del servicio"
  type        = string
  default     = "orders-service"
}

// === ARCHIVO: infra/modules/orders-service/variables.tf ===
variable "environment" {
  description = "Entorno de despliegue (dev, prod, etc.)"
  type        = string
}

variable "service_name" {
  description = "Nombre del servicio"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC donde se desplegará el servicio"
  type        = string
}

variable "public_subnet_ids" {
  description = "Lista de IDs de subnets públicas"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Lista de IDs de subnets privadas"
  type        = list(string)
}

variable "db_username" {
  description = "Nombre de usuario para la base de datos"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Contraseña para la base de datos"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "Clase de instancia para la base de datos"
  type        = string
}

variable "db_allocated_storage" {
  description = "Almacenamiento asignado para la base de datos en GB"
  type        = number
}

variable "ecs_task_cpu" {
  description = "CPU asignada para la tarea de ECS"
  type        = number
}

variable "ecs_task_memory" {
  description = "Memoria asignada para la tarea de ECS en MB"
  type        = number
}

variable "ecs_desired_count" {
  description = "Número deseado de tareas de ECS en ejecución"
  type        = number
}

variable "container_port" {
  description = "Puerto expuesto por el contenedor"
  type        = number
  default     = 8080
}

variable "ecr_repository_url" {
  description = "URL del repositorio ECR para las imágenes del servicio"
  type        = string
}

variable "image_tag" {
  description = "Tag de la imagen Docker a desplegar"
  type        = string
  default     = "latest"
}

// === ARCHIVO: infra/environments/dev/variables.tf ===
variable "aws_region" {
  description = "Región de AWS para el entorno de desarrollo"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC en desarrollo"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Bloques CIDR para subnets públicas en desarrollo"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Bloques CIDR para subnets privadas en desarrollo"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "db_username" {
  description = "Usuario para la base de datos en desarrollo"
  type        = string
  default     = "devadmin"
  sensitive   = true
}

variable "db_password" {
  description = "Contraseña para la base de datos en desarrollo"
  type        = string
  default     = "devpassword123"
  sensitive   = true
}

variable "db_instance_class" {
  description = "Clase de instancia para la base de datos en desarrollo"
  type        = string
  default     = "db.t3.micro"
}

variable "ecs_task_cpu" {
  description = "CPU para tareas ECS en desarrollo"
  type        = number
  default     = 256
}

variable "ecs_task_memory" {
  description = "Memoria para tareas ECS en desarrollo"
  type        = number
  default     = 512
}

// === ARCHIVO: infra/environments/prod/variables.tf ===
variable "aws_region" {
  description = "Región de AWS para el entorno de producción"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
  default     = "prod"
}

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC en producción"
  type        = string
  default     = "10.1.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Bloques CIDR para subnets públicas en producción"
  type        = list(string)
  default     = ["10.1.1.0/24", "10.1.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Bloques CIDR para subnets privadas en producción"
  type        = list(string)
  default     = ["10.1.3.0/24", "10.1.4.0/24"]
}

variable "db_username" {
  description = "Usuario para la base de datos en producción"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Contraseña para la base de datos en producción"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "Clase de instancia para la base de datos en producción"
  type        = string
  default     = "db.t3.medium"
}

variable "db_allocated_storage" {
  description = "Almacenamiento para la base de datos en producción"
  type        = number
  default     = 100
}

variable "ecs_task_cpu" {
  description = "CPU para tareas ECS en producción"
  type        = number
  default     = 1024
}

variable "ecs_task_memory" {
  description = "Memoria para tareas ECS en producción"
  type        = number
  default     = 2048
}

variable "ecs_desired_count" {
  description = "Número deseado de tareas ECS en producción"
  type        = number
  default     = 2
}

variable "enable_multi_az" {
  description = "Habilitar despliegue multi-AZ para la base de datos en producción"
  type        = bool
  default     = true
}

variable "backup_retention_period" {
  description = "Período de retención de backups en días para producción"
  type        = number
  default     = 7
}

// === ARCHIVO: infra/versions.tf ===
terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.65"
    }
  }
}

// === ARCHIVO: infra/main.tf ===
# Proveedor AWS configurado a nivel de raíz
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = var.common_tags
  }

  skip_credentials_validation = var.skip_credentials_validation
  skip_requesting_account_id  = var.skip_requesting_account_id
  skip_metadata_api_check     = var.skip_metadata_api_check
}

// Módulo del servicio de órdenes
module "orders_service" {
  source = "./modules/orders-service"

  # Variables de entrada al módulo
  environment           = var.environment
  vpc_id                = var.vpc_id
  subnet_ids            = var.subnet_ids
  db_instance_class     = var.db_instance_class
  db_allocated_storage  = var.db_allocated_storage
  ecs_cluster_name      = var.ecs_cluster_name
  ecs_service_name      = var.ecs_service_name
  container_image       = var.container_image
  container_port        = var.container_port
  desired_count         = var.desired_count
  min_count             = var.min_count
  max_count             = var.max_count
  alb_target_group_arn  = var.alb_target_group_arn
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
  common_tags           = var.common_tags
}

// === ARCHIVO: infra/README.md ===
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

// === ARCHIVO: infra/outputs.tf ===
# Outputs - Definición de salidas para exponer información de la infraestructura
# Superficie de práctica: el estudiante debe completar los outputs requeridos

# Output para el ID del bucket S3
output "bucket_id" {
  description = "Identificador único del bucket S3"
  value       = aws_s3_bucket.orders_bucket.id
}

# Output para el ARN del bucket S3
output "bucket_arn" {
  description = "ARN del bucket S3"
  value       = aws_s3_bucket.orders_bucket.arn
}

# Output para el nombre de la tabla DynamoDB
output "dynamodb_table_name" {
  description = "Nombre de la tabla DynamoDB"
  value       = aws_dynamodb_table.orders_table.name
}

# Output para el ARN de la tabla DynamoDB
output "dynamodb_table_arn" {
  description = "ARN de la tabla DynamoDB"
  value       = aws_dynamodb_table.orders_table.arn
}

# Output para el endpoint de la API Gateway
output "api_gateway_endpoint" {
  description = "Endpoint público de la API"
  value       = aws_api_gateway_stage.prod.invoke_url
}

# Output para el ID del clúster ECS
output "ecs_cluster_id" {
  description = "Identificador del clúster ECS"
  value       = aws_ecs_cluster.main.id
}

# Output para el nombre del clúster ECS
output "ecs_cluster_name" {
  description = "Nombre del clúster ECS"
  value       = aws_ecs_cluster.main.name
}

# Output para el nombre del servicio ECS
output "ecs_service_name" {
  description = "Nombre del servicio ECS"
  value       = aws_ecs_service.orders_service.name
}

# Output para la URL del balanceador de carga
output "alb_dns_name" {
  description = "Nombre DNS del Application Load Balancer"
  value       = aws_lb.orders_alb.dns_name
}

# Output para el ARN del balanceador de carga
output "alb_arn" {
  description = "ARN del Application Load Balancer"
  value       = aws_lb.orders_alb.arn
}

# Output para la zona deHosted Zone de Route 53
output "route53_zone_id" {
  description = "ID de la zona hosted de Route 53"
  value       = aws_route53_zone.main.zone_id
}

# Output para el nombre de dominio configurado
output "domain_name" {
  description = "Nombre de dominio configurado"
  value       = var.domain_name
}

# Output para el topic SNS de notificaciones
output "sns_topic_arn" {
  description = "ARN del topic SNS para notificaciones"
  value       = aws_sns_topic.orders_notifications.arn
}

# Output para la cola SQS de eventos
output "sqs_queue_url" {
  description = "URL de la cola SQS para procesamiento de eventos"
  value       = aws_sqs_queue.orders_events.url
}

# Output para el ARN de la cola SQS
output "sqs_queue_arn" {
  description = "ARN de la cola SQS"
  value       = aws_sqs_queue.orders_events.arn
}

# Output para el nombre del secreto de Secrets Manager
output "secrets_manager_secret_name" {
  description = "Nombre del secreto en Secrets Manager"
  value       = aws_secretsmanager_secret.db_credentials.name
}

# Output para el ID del Log Group de CloudWatch
output "cloudwatch_log_group_name" {
  description = "Nombre del grupo de logs de CloudWatch"
  value       = aws_cloudwatch_log_group.orders_logs.name
}

// === ARCHIVO: infra/environments/dev/terraform.tfvars ===
# Valores de variables específicos para el entorno de desarrollo
# Estas variables personalizan la infraestructura desplegada en AWS para este ambiente

# Configuración regional aws_region = "us-east-1"

# Parámetros del entorno
environment = "dev"

# Configuración de red
vpc_cidr           = "10.0.0.0/16"
public_subnet_cidr = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidr = ["10.0.10.0/24", "10.0.20.0/24"]

# Configuración del servicio de órdenes
orders_service_name         = "orders-service"
orders_service_port         = 8080
orders_service_desired_count = 2
orders_service_min_count    = 1
orders_service_max_count    = 4
orders_service_instance_type = "t3.micro"

# Configuración de base de datos
db_instance_class    = "db.t3.micro"
db_allocated_storage = 20
db_name              = "orders_dev"
db_username          = "ordersadmin"

# Habilitar características según entorno
enable_deletion_protection = false
enable_detailed_monitoring = false

# Configuración de seguridad
allowed_cidr_blocks = ["0.0.0.0/0"]

// === ARCHIVO: infra/environments/dev/main.tf ===
# Configuración específica para el entorno de desarrollo
# SUPERFICIE DE PRÁCTICA: Stub que el participante debe completar

# Referencia al módulo del servicio de órdenes
module "orders_service" {
  source = "../../modules/orders-service"

  # Variables específicas del entorno
  environment = var.environment

  # Configuración de red
  vpc_id             = data.aws_vpc.main.id
  private_subnet_ids = data.aws_subnets.private.ids

  # Configuración del servicio
  service_name    = var.orders_service_name
  service_port    = var.orders_service_port
  instance_type   = var.orders_service_instance_type
  desired_count   = var.orders_service_desired_count
  min_count       = var.orders_service_min_count
  max_count       = var.orders_service_max_count

  # Configuración de base de datos
  db_instance_class    = var.db_instance_class
  db_allocated_storage = var.db_allocated_storage
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password

  # Configuración de seguridad
  enable_deletion_protection = var.enable_deletion_protection

  # Tags
  tags = var.common_tags
}

// === ARCHIVO: infra/environments/prod/main.tf ===
# Configuración específica para el entorno de producción
# SUPERFICIE DE PRÁCTICA: Stub que el participante debe completar

# Referencia al módulo del servicio de órdenes
module "orders_service" {
  source = "../../modules/orders-service"

  # Variables específicas del entorno
  environment = var.environment

  # Configuración de red
  vpc_id             = data.aws_vpc.main.id
  private_subnet_ids = data.aws_subnets.private.ids

  # Configuración del servicio - producción usa recursos más grandes
  service_name    = var.orders_service_name
  service_port    = var.orders_service_port
  instance_type   = "t3.small"  # Producción requiere más recursos
  desired_count   = var.orders_service_desired_count
  min_count       = var.orders_service_min_count
  max_count       = var.orders_service_max_count

  # Configuración de base de datos - producción usa instancia mayor
  db_instance_class    = "db.t3.small"
  db_allocated_storage = var.db_allocated_storage
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password

  # Configuración de seguridad - producción tiene protección habilitada
  enable_deletion_protection = var.enable_deletion_protection

  # Tags
  tags = var.common_tags
}

// === ARCHIVO: infra/modules/orders-service/main.tf ===
# TODO: Implementar los recursos de infraestructura para el servicio de órdenes
# Este archivo debe contener la definición de recursos AWS específicos para el servicio
#
# Recursos sugeridos a implementar:
# - VPC y subnets
# - EC2 Instance o ECS Task Definition
# - RDS Instance para persistencia
# - Security Groups
# - Elastic Load Balancer (opcional)
# - S3 Bucket para almacenamiento (opcional)

# Ejemplo de estructura base:
# resource "aws_vpc" "orders_vpc" {
#   cidr_block           = var.vpc_cidr
#   enable_dns_hostnames = true
#   enable_dns_support   = true
#   
#   tags = {
#     Name        = "orders-vpc-${var.environment}"
#     Environment = var.environment
#   }
# }

// === ARCHIVO: infra/modules/orders-service/outputs.tf ===
# TODO: Definir los outputs del módulo para exponer información crítica
# Este archivo debe contener las salidas que otros módulos o configuraciones
# necesitan conocer para integrarse correctamente
#
# Outputs sugeridos a implementar:
# - ID de la VPC creada
# - IDs de las subnets
# - Endpoint de la base de datos
# - ARN del security group
# - URL del servicio (si aplica ALB)

# Ejemplo de estructura base:
# output "vpc_id" {
#   description = "ID de la VPC del servicio de órdenes"
#   value       = aws_vpc.orders_vpc.id
# }

// === ARCHIVO: api/pom.xml ===
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.5.6</version>
        <relativePath/>
    </parent>

    <groupId>com.orders</groupId>
    <artifactId>api</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>orders-api</name>
    <description>API para gestión de órdenes</description>

    <properties>
        <java.version>21</java.version>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
    </properties>

    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-validation</artifactId>
        </dependency>
        <dependency>
            <groupId>org.postgresql</groupId>
            <artifactId>postgresql</artifactId>
            <scope>runtime</scope>
            <version>42.7.3</version>
        </dependency>
        <dependency>
            <groupId>org.flywaydb</groupId>
            <artifactId>flyway-core</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-actuator</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-configuration-processor</artifactId>
            <optional>true</optional>
        </dependency>
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <version>1.18.32</version>
            <scope>provided</scope>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <configuration>
                    <source>21</source>
                    <target>21</target>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>

// === ARCHIVO: api/src/main/java/com/orders/api/OrdersApiApplication.java ===
package com.orders.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.core.env.Environment;

import java.util.concurrent.Executor;

@SpringBootApplication
@ConfigurationPropertiesScan
@EnableAsync
public class OrdersApiApplication {
    private final Environment environment;

    public OrdersApiApplication(Environment environment) {
        this.environment = environment;
        validateEnvironment();
    }

    public static void main(String[] args) {
        SpringApplication.run(OrdersApiApplication.class, args);
    }

    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }

    @Bean
    public Executor taskExecutor() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(5);
        executor.setMaxPoolSize(10);
        executor.setQueueCapacity(100);
        executor.setThreadNamePrefix("OrderAsync-");
        executor.initialize();
        return executor;
    }

    private void validateEnvironment() {
        String dbUrl = environment.getProperty("spring.datasource.url");
        String dbUsername = environment.getProperty("spring.datasource.username");
        String dbPassword = environment.getProperty("spring.datasource.password");

        if (dbUrl == null || dbUsername == null || dbPassword == null) {
            throw new IllegalStateException(
                "Las propiedades de la base de datos no están configuradas correctamente. " +
                "Verifica application.yml o las variables de entorno."
            );
        }

        if (!dbUrl.startsWith("jdbc:postgresql://")) {
            throw new IllegalStateException(
                "La URL de la base de datos debe ser de PostgreSQL (empezar con 'jdbc:postgresql://')"
            );
        }
    }
}

// === ARCHIVO: api/src/main/resources/application.yml ===
server:
  port: 8080
  servlet:
    context-path: /

spring:
  application:
    name: orders-api
  datasource:
    url: jdbc:postgresql://localhost:5432/orders_db
    username: orders_user
    password: orders_password
    driver-class-name: org.postgresql.Driver
    hikari:
      maximum-pool-size: 10
      connection-timeout: 30000
      idle-timeout: 600000
      max-lifetime: 1800000
  jpa:
    hibernate:
      ddl-auto: validate
    show-sql: true
    properties:
      hibernate:
        format_sql: true
        dialect: org.hibernate.dialect.PostgreSQLDialect
  flyway:
    enabled: true
    locations: classpath:db/migration
    baseline-on-migrate: true
    validate-on-migrate: true
  mvc:
    throw-exception-if-no-handler-found: true
  web:
    resources:
      add-mappings: false

management:
  endpoints:
    web:
      exposure:
        include: health,info,metrics
  endpoint:
    health:
      show-details: always

logging:
  level:
    root: INFO
    com.orders.api: DEBUG
    org.springframework.web: INFO
    org.hibernate.SQL: DEBUG
    org.hibernate.type.descriptor.sql.BasicBinder: TRACE

// === ARCHIVO: api/src/main/java/com/orders/api/domain/Order.java ===
package com.orders.api.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @NotNull
    @Column(nullable = false)
    private UUID customerId;

    @NotEmpty
    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "order_items", joinColumns = @JoinColumn(name = "order_id"))
    private List<OrderItem> items;

    @NotNull
    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private OrderStatus status;

    @NotNull
    @Column(nullable = false)
    private LocalDateTime createdAt;

    @Column
    private LocalDateTime updatedAt;

    @NotNull
    @PositiveOrZero
    @Column(nullable = false, precision = 19, scale = 2)
    private BigDecimal totalAmount;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        if (status == null) {
            status = OrderStatus.PENDING;
        }
        calculateTotalAmount();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
        calculateTotalAmount();
    }

    private void calculateTotalAmount() {
        if (items == null || items.isEmpty()) {
            totalAmount = BigDecimal.ZERO;
            return;
        }
        totalAmount = items.stream()
                .map(OrderItem::getTotalPrice)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder(toBuilder = true)
    @Embeddable
    public static class OrderItem {
        @NotNull
        @Column(name = "product_id", nullable = false)
        private UUID productId;

        @NotBlank
        @Column(name = "product_name", nullable = false)
        private String productName;

        @NotNull
        @Positive
        @Column(nullable = false)
        private Integer quantity;

        @NotNull
        @PositiveOrZero
        @Column(nullable = false, precision = 19, scale = 2)
        private BigDecimal unitPrice;

        @Transient
        public BigDecimal getTotalPrice() {
            return unitPrice.multiply(BigDecimal.valueOf(quantity));
        }
    }

    public enum OrderStatus {
        PENDING,
        PROCESSING,
        COMPLETED,
        CANCELLED
    }
}

// === ARCHIVO: api/src/main/java/com/orders/api/domain/OrderRepository.java ===
package com.orders.api.domain;

import java.util.Optional;
import java.util.UUID;

public interface OrderRepository {
    Order save(Order order);
    Optional<Order> findById(UUID id);
    void deleteById(UUID id);
}

// === ARCHIVO: api/src/main/java/com/orders/api/infrastructure/persistence/OrderJpaRepository.java ===
package com.orders.api.infrastructure.persistence;

import com.orders.api.domain.Order;
import com.orders.api.domain.OrderRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface OrderJpaRepository extends JpaRepository<Order, UUID>, OrderRepository {
    @Override
    default Order save(Order order) {
        try {
            return saveAndFlush(order);
        } catch (Exception e) {
            throw new RuntimeException("Failed to save order: " + e.getMessage(), e);
        }
    }

    @Override
    default Optional<Order> findById(UUID id) {
        if (id == null) {
            throw new IllegalArgumentException("Order ID cannot be null");
        }
        return findById(id).map(order -> {
            if (order.getItems() == null || order.getItems().isEmpty()) {
                throw new EntityNotFoundException("Order with ID " + id + " has no items");
            }
            return order;
        });
    }

    @Override
    default void deleteById(UUID id) {
        if (id == null) {
            throw new IllegalArgumentException("Order ID cannot be null");
        }
        try {
            deleteById(id);
            flush();
        } catch (Exception e) {
            throw new RuntimeException("Failed to delete order with ID " + id + ": " + e.getMessage(), e);
        }
    }
}

// === ARCHIVO: api/src/main/java/com/orders/api/application/OrderService.java ===
package com.orders.api.application;

import com.orders.api.domain.Order;
import com.orders.api.domain.OrderRepository;
import com.orders.api.domain.Order.OrderItem;
import com.orders.api.domain.Order.OrderStatus;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@Transactional
public class OrderService {

    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public OrderResponseDTO createOrder(@Valid OrderRequestDTO request) {
        validateRequest(request);
        
        Order order = new Order();
        order.setId(UUID.randomUUID());
        order.setCustomerId(request.customerId());
        order.setStatus(OrderStatus.PENDING);
        order.setCreatedAt(LocalDateTime.now());
        order.setUpdatedAt(LocalDateTime.now());
        
        List<OrderItem> items = new ArrayList<>();
        for (OrderRequestDTO.OrderItemDTO itemDTO : request.items()) {
            OrderItem item = new OrderItem();
            item.setProductId(itemDTO.productId());
            item.setQuantity(itemDTO.quantity());
            item.setUnitPrice(itemDTO.unitPrice());
            items.add(item);
        }
        order.setItems(items);
        
        Order savedOrder = orderRepository.save(order);
        return mapToResponseDTO(savedOrder);
    }

    @Transactional(readOnly = true)
    public Optional<OrderResponseDTO> getOrder(UUID id) {
        if (id == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }
        return orderRepository.findById(id).map(this::mapToResponseDTO);
    }

    public Optional<OrderResponseDTO> updateOrder(UUID id, @Valid OrderRequestDTO request) {
        if (id == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }
        validateRequest(request);
        
        Optional<Order> existingOrderOpt = orderRepository.findById(id);
        if (existingOrderOpt.isEmpty()) {
            return Optional.empty();
        }
        
        Order existingOrder = existingOrderOpt.get();
        if (existingOrder.getStatus() == OrderStatus.CANCELLED || existingOrder.getStatus() == OrderStatus.COMPLETED) {
            throw new IllegalStateException("No se puede modificar una orden cancelada o completada");
        }
        
        existingOrder.setCustomerId(request.customerId());
        existingOrder.setUpdatedAt(LocalDateTime.now());
        
        List<OrderItem> items = new ArrayList<>();
        for (OrderRequestDTO.OrderItemDTO itemDTO : request.items()) {
            OrderItem item = new OrderItem();
            item.setProductId(itemDTO.productId());
            item.setQuantity(itemDTO.quantity());
            item.setUnitPrice(itemDTO.unitPrice());
            items.add(item);
        }
        existingOrder.setItems(items);
        
        Order updatedOrder = orderRepository.save(existingOrder);
        return Optional.of(mapToResponseDTO(updatedOrder));
    }

    public boolean deleteOrder(UUID id) {
        if (id == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }
        
        Optional<Order> existingOrder = orderRepository.findById(id);
        if (existingOrder.isEmpty()) {
            return false;
        }
        
        Order order = existingOrder.get();
        if (order.getStatus() == OrderStatus.COMPLETED) {
            throw new IllegalStateException("No se puede eliminar una orden completada");
        }
        
        orderRepository.deleteById(id);
        return true;
    }

    private void validateRequest(OrderRequestDTO request) {
        if (request == null) {
            throw new IllegalArgumentException("La solicitud no puede ser nula");
        }
        if (request.customerId() == null) {
            throw new IllegalArgumentException("El ID del cliente es obligatorio");
        }
        if (request.items() == null || request.items().isEmpty()) {
            throw new IllegalArgumentException("La orden debe tener al menos un artículo");
        }
        for (OrderRequestDTO.OrderItemDTO item : request.items()) {
            if (item.productId() == null) {
                throw new IllegalArgumentException("El ID del producto es obligatorio");
            }
            if (item.quantity() == null || item.quantity() <= 0) {
                throw new IllegalArgumentException("La cantidad debe ser mayor a cero");
            }
            if (item.unitPrice() == null || item.unitPrice().compareTo(BigDecimal.ZERO) <= 0) {
                throw new IllegalArgumentException("El precio unitario debe ser mayor a cero");
            }
        }
    }

    private OrderResponseDTO mapToResponseDTO(Order order) {
        List<OrderResponseDTO.OrderItemDTO> itemDTOs = new ArrayList<>();
        if (order.getItems() != null) {
            for (OrderItem item : order.getItems()) {
                itemDTOs.add(new OrderResponseDTO.OrderItemDTO(
                    item.getProductId(),
                    item.getQuantity(),
                    item.getUnitPrice()
                ));
            }
        }
        return new OrderResponseDTO(
            order.getId(),
            order.getCustomerId(),
            itemDTOs,
            order.getStatus().name(),
            order.getCreatedAt(),
            order.getUpdatedAt(),
            order.getTotalAmount()
        );
    }

    public record OrderRequestDTO(
        @NotNull(message = "El ID del cliente es obligatorio")
        UUID customerId,
        @NotNull(message = "Los artículos son obligatorios")
        @NotNull(message = "La lista de artículos no puede estar vacía")
        List<OrderItemDTO> items
    ) {
        public record OrderItemDTO(
            @NotNull(message = "El ID del producto es obligatorio")
            UUID productId,
            @NotNull(message = "La cantidad es obligatoria")
            Integer quantity,
            @NotNull(message = "El precio unitario es obligatorio")
            BigDecimal unitPrice
        ) {}
    }

    public record OrderResponseDTO(
        UUID id,
        UUID customerId,
        List<OrderItemDTO> items,
        String status,
        LocalDateTime createdAt,
        LocalDateTime updatedAt,
        BigDecimal totalAmount
    ) {
        public record OrderItemDTO(
            UUID productId,
            Integer quantity,
            BigDecimal unitPrice
        ) {}
    }
}

// === ARCHIVO: api/src/main/java/com/orders/api/infrastructure/web/OrderController.java ===
package com.orders.api.infrastructure.web;

import com.orders.api.application.OrderService;
import com.orders.api.application.OrderService.OrderRequestDTO;
import com.orders.api.application.OrderService.OrderResponseDTO;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/api/orders")
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @PostMapping
    public ResponseEntity<OrderResponseDTO> createOrder(@Valid @RequestBody OrderRequestDTO request) {
        OrderResponseDTO response = orderService.createOrder(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @GetMapping("/{id}")
    public ResponseEntity<OrderResponseDTO> getOrder(@PathVariable UUID id) {
        return orderService.getOrder(id)
            .map(ResponseEntity::ok)
            .orElse(ResponseEntity.notFound().build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<OrderResponseDTO> updateOrder(
            @PathVariable UUID id,
            @Valid @RequestBody OrderRequestDTO request) {
        return orderService.updateOrder(id, request)
            .map(ResponseEntity::ok)
            .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteOrder(@PathVariable UUID id) {
        boolean deleted = orderService.deleteOrder(id);
        if (deleted) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping
    public ResponseEntity<List<OrderResponseDTO>> getAllOrders() {
        return ResponseEntity.ok(List.of());
    }
}

// === ARCHIVO: api/src/main/resources/db/migration/V1__initial_schema.sql ===
-- Migración inicial del esquema de base de datos para el servicio de órdenes
-- Versión: V1
-- Autor: Sistema de migración Flyway

-- Tabla principal de órdenes
CREATE TABLE orders (
    id UUID PRIMARY KEY,
    customer_id UUID NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'PENDING',
    total_amount DECIMAL(19, 4) NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de artículos de orden
CREATE TABLE order_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    order_id UUID NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    product_id UUID NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(19, 4) NOT NULL CHECK (unit_price > 0),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Índices para optimizar consultas frecuentes
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_orders_created_at ON orders(created_at);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);

-- Comentarios para documentación del esquema
COMMENT ON TABLE orders IS 'Almacena las órdenes realizadas por los clientes';
COMMENT ON TABLE order_items IS 'Contiene los artículos asociados a cada orden';
COMMENT ON COLUMN orders.status IS 'Estados posibles: PENDING, CONFIRMED, PROCESSING, COMPLETED, CANCELLED';
COMMENT ON COLUMN orders.total_amount IS 'Monto total de la orden calculado automáticamente';
```
