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