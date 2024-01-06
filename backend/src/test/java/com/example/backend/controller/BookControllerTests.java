package com.example.backend.controller;

import com.example.backend.BaseTestClass;
import com.example.backend.utils.AuthenticationTestUtils;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import java.nio.charset.StandardCharsets;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class BookControllerTests extends BaseTestClass {
    @Autowired
    AuthenticationTestUtils authenticationTestUtils;

    @Test
    public void getAllBooks() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .get("/api/books")
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
    }

    @Test
    public void getAllBooksAsAnonymous() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .get("/api/books")
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isForbidden());
    }
}
