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