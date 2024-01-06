package com.example.backend.restdata;

import com.example.backend.BaseTestClass;
import com.example.backend.utils.AuthenticationTestUtils;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import java.nio.charset.StandardCharsets;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class BooksRestTest extends BaseTestClass {
    @Autowired
    private AuthenticationTestUtils authenticationTestUtils;

    @Test
    public void testGetBooks() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .get("/api/data/books")
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.admin())
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk()).andReturn();
    }

    final String validPost = "{" +
            "\"name\": \"Harry Potter and the Sorcerer's Stone\"," +
            "\"category\": \"Fantasy\"," +
            "\"releaseDateMillis\": 1704560451442," +
            "\"author\": \"http://localhost:8080/api/data/authors/1\"" +
        "}";

    @Test
    public void testPostBook() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/data/books")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .content(validPost)
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isCreated()).andReturn();
    }
}
