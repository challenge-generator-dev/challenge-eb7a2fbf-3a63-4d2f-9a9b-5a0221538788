package com.orders.api.application;

import com.orders.api.domain.Order;
import com.orders.api.domain.OrderRepository;
import com.orders.api.domain.Order.OrderItem;
import com.orders.api.domain.Order.OrderStatus;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@Transactional
public class OrderService {

    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public OrderResponseDTO createOrder(@Valid OrderRequestDTO request) {
        validateRequest(request);
        
        Order order = new Order();
        order.setId(UUID.randomUUID());
        order.setCustomerId(request.customerId());
        order.setStatus(OrderStatus.PENDING);
        order.setCreatedAt(LocalDateTime.now());
        order.setUpdatedAt(LocalDateTime.now());
        
        List<OrderItem> items = new ArrayList<>();
        for (OrderRequestDTO.OrderItemDTO itemDTO : request.items()) {
            OrderItem item = new OrderItem();
            item.setProductId(itemDTO.productId());
            item.setQuantity(itemDTO.quantity());
            item.setUnitPrice(itemDTO.unitPrice());
            items.add(item);
        }
        order.setItems(items);
        
        Order savedOrder = orderRepository.save(order);
        return mapToResponseDTO(savedOrder);
    }

    @Transactional(readOnly = true)
    public Optional<OrderResponseDTO> getOrder(UUID id) {
        if (id == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }
        return orderRepository.findById(id).map(this::mapToResponseDTO);
    }

    public Optional<OrderResponseDTO> updateOrder(UUID id, @Valid OrderRequestDTO request) {
        if (id == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }
        validateRequest(request);
        
        Optional<Order> existingOrderOpt = orderRepository.findById(id);
        if (existingOrderOpt.isEmpty()) {
            return Optional.empty();
        }
        
        Order existingOrder = existingOrderOpt.get();
        if (existingOrder.getStatus() == OrderStatus.CANCELLED || existingOrder.getStatus() == OrderStatus.COMPLETED) {
            throw new IllegalStateException("No se puede modificar una orden cancelada o completada");
        }
        
        existingOrder.setCustomerId(request.customerId());
        existingOrder.setUpdatedAt(LocalDateTime.now());
        
        List<OrderItem> items = new ArrayList<>();
        for (OrderRequestDTO.OrderItemDTO itemDTO : request.items()) {
            OrderItem item = new OrderItem();
            item.setProductId(itemDTO.productId());
            item.setQuantity(itemDTO.quantity());
            item.setUnitPrice(itemDTO.unitPrice());
            items.add(item);
        }
        existingOrder.setItems(items);
        
        Order updatedOrder = orderRepository.save(existingOrder);
        return Optional.of(mapToResponseDTO(updatedOrder));
    }

    public boolean deleteOrder(UUID id) {
        if (id == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }
        
        Optional<Order> existingOrder = orderRepository.findById(id);
        if (existingOrder.isEmpty()) {
            return false;
        }
        
        Order order = existingOrder.get();
        if (order.getStatus() == OrderStatus.COMPLETED) {
            throw new IllegalStateException("No se puede eliminar una orden completada");
        }
        
        orderRepository.deleteById(id);
        return true;
    }

    private void validateRequest(OrderRequestDTO request) {
        if (request == null) {
            throw new IllegalArgumentException("La solicitud no puede ser nula");
        }
        if (request.customerId() == null) {
            throw new IllegalArgumentException("El ID del cliente es obligatorio");
        }
        if (request.items() == null || request.items().isEmpty()) {
            throw new IllegalArgumentException("La orden debe tener al menos un artículo");
        }
        for (OrderRequestDTO.OrderItemDTO item : request.items()) {
            if (item.productId() == null) {
                throw new IllegalArgumentException("El ID del producto es obligatorio");
            }
            if (item.quantity() == null || item.quantity() <= 0) {
                throw new IllegalArgumentException("La cantidad debe ser mayor a cero");
            }
            if (item.unitPrice() == null || item.unitPrice().compareTo(BigDecimal.ZERO) <= 0) {
                throw new IllegalArgumentException("El precio unitario debe ser mayor a cero");
            }
        }
    }

    private OrderResponseDTO mapToResponseDTO(Order order) {
        List<OrderResponseDTO.OrderItemDTO> itemDTOs = new ArrayList<>();
        if (order.getItems() != null) {
            for (OrderItem item : order.getItems()) {
                itemDTOs.add(new OrderResponseDTO.OrderItemDTO(
                    item.getProductId(),
                    item.getQuantity(),
                    item.getUnitPrice()
                ));
            }
        }
        return new OrderResponseDTO(
            order.getId(),
            order.getCustomerId(),
            itemDTOs,
            order.getStatus().name(),
            order.getCreatedAt(),
            order.getUpdatedAt(),
            order.getTotalAmount()
        );
    }

    public record OrderRequestDTO(
        @NotNull(message = "El ID del cliente es obligatorio")
        UUID customerId,
        @NotNull(message = "Los artículos son obligatorios")
        @NotNull(message = "La lista de artículos no puede estar vacía")
        List<OrderItemDTO> items
    ) {
        public record OrderItemDTO(
            @NotNull(message = "El ID del producto es obligatorio")
            UUID productId,
            @NotNull(message = "La cantidad es obligatoria")
            Integer quantity,
            @NotNull(message = "El precio unitario es obligatorio")
            BigDecimal unitPrice
        ) {}
    }

    public record OrderResponseDTO(
        UUID id,
        UUID customerId,
        List<OrderItemDTO> items,
        String status,
        LocalDateTime createdAt,
        LocalDateTime updatedAt,
        BigDecimal totalAmount
    ) {
        public record OrderItemDTO(
            UUID productId,
            Integer quantity,
            BigDecimal unitPrice
        ) {}
    }
}