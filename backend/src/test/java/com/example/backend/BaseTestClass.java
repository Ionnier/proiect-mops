package com.example.backend;

import com.example.backend.repositories.BookInventoryRepository;
import com.example.backend.repositories.BookRepository;
import com.example.backend.repositories.RentedBookRepository;
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
    protected MockMvc mvc;

    @Autowired
    protected WebApplicationContext context;

    @Autowired
    protected ObjectMapper objectMapper;

    @Autowired
    protected UserRepository userRepository;

    @Autowired
    protected Path stubsPath;

    @Autowired
    protected BookInventoryRepository bookInventoryRepository;

    @Autowired
    protected BookRepository bookRepository;

    @Autowired
    protected RentedBookRepository rentedBookRepository;

}
