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