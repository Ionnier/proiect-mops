package com.example.backend.utils;

import com.example.backend.controller.AuthControllerTests;
import com.example.backend.repositories.UserRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.nio.file.Path;

import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;

@Configuration
public class Utils {
    @Bean
    MockMvc contextLoads(WebApplicationContext context) {
        return MockMvcBuilders
                .webAppContextSetup(context)
                .apply(springSecurity())
                .build();
    }

    @Bean("mockserverPath")
    public Path getStubPath() {
        return Path.of(Path.of("").toAbsolutePath().getParent().toString(), "mockserver", "__files", "bodyFiles");
    }

    @Bean
    AuthControllerTests provideAuthTests() {
        return new AuthControllerTests();
    }
}
