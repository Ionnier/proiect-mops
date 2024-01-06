package com.example.backend;

import com.example.backend.repositories.UserRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.context.WebApplicationContext;

import java.nio.file.Path;

@SpringBootTest
@DirtiesContext(classMode = DirtiesContext.ClassMode.BEFORE_EACH_TEST_METHOD)
public abstract class BaseTestClass {
    @Autowired
    public MockMvc mvc;

    @Autowired
    public WebApplicationContext context;

    @Autowired
    public ObjectMapper objectMapper;

    @Autowired
    public UserRepository userRepository;

    @Autowired
    public Path stubsPath;

}
