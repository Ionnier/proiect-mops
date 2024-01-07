package com.example.backend.restdata;

import com.example.backend.BaseTestClass;
import com.example.backend.models.BookInventory;
import com.example.backend.repositories.BookInventoryRepository;
import com.example.backend.utils.AuthenticationTestUtils;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import java.nio.charset.StandardCharsets;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class BookInventoryTest extends BaseTestClass {
    @Autowired
    AuthenticationTestUtils authenticationTestUtils;

    @Autowired
    BookInventoryRepository bookInventoryRepository;

    final String validPost = "{" +
            "\"state\": \"asd\"," +
            "\"book\": \"http://localhost/api/data/books1/1\"" +
            "}";

    @Test
    public void canAddBookInventory() throws Exception {
        long initialSize = bookInventoryRepository.count();
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/data/bookInventories")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .content(validPost)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.admin())
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isCreated()).andReturn();
        assert initialSize + 1 == bookInventoryRepository.count();
    }

}
