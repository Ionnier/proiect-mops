package com.example.backend.configuration;

import com.example.backend.models.*;
import com.example.backend.models.dtos.SignupRequest;
import com.example.backend.repositories.*;
import com.example.backend.services.AuthenticationService;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.StringUtils;

@Configuration
@RequiredArgsConstructor
public class InitializationConfig {
    private final DataSourceProperties dataSourceProperties;

    @Bean
    public CommandLineRunner dataLoader() {
        return args -> {

            String dataSourceUrl = dataSourceProperties.determineUrl();

            if (!StringUtils.hasText(dataSourceUrl) && !dataSourceUrl.contains("mem") && !dataSourceUrl.contains("h2")) {
                return;
            }

        };
    }
}
