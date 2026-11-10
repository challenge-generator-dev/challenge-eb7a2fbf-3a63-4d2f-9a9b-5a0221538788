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