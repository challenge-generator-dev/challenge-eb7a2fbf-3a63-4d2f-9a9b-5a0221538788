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