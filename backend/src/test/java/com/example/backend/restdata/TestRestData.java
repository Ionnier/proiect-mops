package com.example.backend.restdata;

import com.example.backend.BaseTestClass;
import com.example.backend.models.Author;
import com.example.backend.utils.AuthenticationTestUtils;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import java.nio.charset.StandardCharsets;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class TestRestData extends BaseTestClass {
    @Autowired
    private AuthenticationTestUtils authenticationTestUtils;

    @Test
    public void testGetAuthors() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .get("/api/data/authors")
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.admin())
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
    }

    @Test
    public void testGetAuthorsAnonymous() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .get("/api/data/authors")
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isForbidden());
    }

    @Test
    public void testGetAuthorsAsUser() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .get("/api/data/authors")
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isForbidden());
    }

    @Test
    public void testPostAuthor() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/data/authors")
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.admin())
                        .characterEncoding(StandardCharsets.UTF_8)
                        .content(objectMapper.writeValueAsString(new Author(null, "hey")))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isCreated());
    }

}
