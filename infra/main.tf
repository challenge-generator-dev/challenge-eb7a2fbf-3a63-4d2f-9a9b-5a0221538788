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