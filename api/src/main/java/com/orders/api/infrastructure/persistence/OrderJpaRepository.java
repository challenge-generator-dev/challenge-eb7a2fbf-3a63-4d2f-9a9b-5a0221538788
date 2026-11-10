package com.orders.api.infrastructure.persistence;

import com.orders.api.domain.Order;
import com.orders.api.domain.OrderRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface OrderJpaRepository extends JpaRepository<Order, UUID>, OrderRepository {
    @Override
    default Order save(Order order) {
        try {
            return saveAndFlush(order);
        } catch (Exception e) {
            throw new RuntimeException("Failed to save order: " + e.getMessage(), e);
        }
    }

    @Override
    default Optional<Order> findById(UUID id) {
        if (id == null) {
            throw new IllegalArgumentException("Order ID cannot be null");
        }
        return findById(id).map(order -> {
            if (order.getItems() == null || order.getItems().isEmpty()) {
                throw new EntityNotFoundException("Order with ID " + id + " has no items");
            }
            return order;
        });
    }

    @Override
    default void deleteById(UUID id) {
        if (id == null) {
            throw new IllegalArgumentException("Order ID cannot be null");
        }
        try {
            deleteById(id);
            flush();
        } catch (Exception e) {
            throw new RuntimeException("Failed to delete order with ID " + id + ": " + e.getMessage(), e);
        }
    }
}