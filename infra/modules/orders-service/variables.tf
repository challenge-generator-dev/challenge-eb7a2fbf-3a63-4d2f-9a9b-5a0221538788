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