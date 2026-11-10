package com.orders.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.core.env.Environment;

import java.util.concurrent.Executor;

@SpringBootApplication
@ConfigurationPropertiesScan
@EnableAsync
public class OrdersApiApplication {
    private final Environment environment;

    public OrdersApiApplication(Environment environment) {
        this.environment = environment;
        validateEnvironment();
    }

    public static void main(String[] args) {
        SpringApplication.run(OrdersApiApplication.class, args);
    }

    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }

    @Bean
    public Executor taskExecutor() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(5);
        executor.setMaxPoolSize(10);
        executor.setQueueCapacity(100);
        executor.setThreadNamePrefix("OrderAsync-");
        executor.initialize();
        return executor;
    }

    private void validateEnvironment() {
        String dbUrl = environment.getProperty("spring.datasource.url");
        String dbUsername = environment.getProperty("spring.datasource.username");
        String dbPassword = environment.getProperty("spring.datasource.password");

        if (dbUrl == null || dbUsername == null || dbPassword == null) {
            throw new IllegalStateException(
                "Las propiedades de la base de datos no están configuradas correctamente. " +
                "Verifica application.yml o las variables de entorno."
            );
        }

        if (!dbUrl.startsWith("jdbc:postgresql://")) {
            throw new IllegalStateException(
                "La URL de la base de datos debe ser de PostgreSQL (empezar con 'jdbc:postgresql://')"
            );
        }
    }
}