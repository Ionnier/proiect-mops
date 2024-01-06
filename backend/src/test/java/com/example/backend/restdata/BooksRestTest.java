package com.example.backend.restdata;

import com.example.backend.BaseTestClass;
import com.example.backend.models.Book;
import com.example.backend.repositories.BookRepository;
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

    @Autowired
    private BookRepository bookRepository;

    @Test
    public void testGetBooks() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .get("/api/data/books")
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.admin())
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
    }

    final String validPost = "{" +
            "\"name\": \"Harry Potter and the Sorcerer's Stone\"," +
            "\"category\": \"Fantasy\"," +
            "\"releaseDateMillis\": 1704560451442," +
            "\"author\": \"http://localhost/api/data/authors/1\"" +
        "}";

    @Test
    public void testPostBook() throws Exception {
        long initialSize = bookRepository.count();
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/data/books")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .content(validPost)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.admin())
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isCreated()).andReturn();
        assert initialSize + 1 == bookRepository.count();
    }
}
