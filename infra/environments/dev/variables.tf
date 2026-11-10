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