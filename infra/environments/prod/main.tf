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