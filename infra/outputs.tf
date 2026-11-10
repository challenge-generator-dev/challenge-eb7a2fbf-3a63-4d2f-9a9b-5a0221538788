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