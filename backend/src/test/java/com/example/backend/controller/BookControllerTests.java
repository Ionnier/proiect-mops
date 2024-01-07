package com.example.backend.controller;

import com.example.backend.BaseTestClass;
import com.example.backend.configuration.InitializationConfig;
import com.example.backend.models.BookInventory;
import com.example.backend.models.dtos.RentBookRequest;
import com.example.backend.repositories.BookInventoryRepository;
import com.example.backend.repositories.BookRepository;
import com.example.backend.utils.AuthenticationTestUtils;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import java.nio.charset.StandardCharsets;
import java.util.Calendar;

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

    @Test
    public void rentBook() throws Exception {
        bookInventoryRepository.save(new BookInventory(null, "", bookRepository.findById(1L).stream().iterator().next()));
        RentBookRequest rentBookRequest = new RentBookRequest(1L, InitializationConfig.getDate(currentYear, currentMonth, currentDay + 1), 5L);

        mvc.perform(MockMvcRequestBuilders
                        .post("/api/books")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .content(objectMapper.writeValueAsString(rentBookRequest))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isCreated());
    }

    @Test
    public void rentSameBook() throws Exception {
        rentBook();
        RentBookRequest rentBookRequest = new RentBookRequest(1L, InitializationConfig.getDate(currentYear, currentMonth, currentDay + 1), 5L);
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/books")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .content(objectMapper.writeValueAsString(rentBookRequest))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound());
    }

    @Test
    public void rentBookNoInventory() throws Exception {
        RentBookRequest rentBookRequest = new RentBookRequest(1L, InitializationConfig.getDate(currentYear, currentMonth, currentDay + 1), 5L);
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/books")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .content(objectMapper.writeValueAsString(rentBookRequest))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound());
    }

    @Test
    public void rentSameBookMultipleInventories() throws Exception {
        rentBook();
        bookInventoryRepository.save(new BookInventory(null, "", bookRepository.findById(1L).stream().iterator().next()));
        RentBookRequest rentBookRequest = new RentBookRequest(1L, InitializationConfig.getDate(currentYear, currentMonth, currentDay + 1), 5L);
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/books")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .content(objectMapper.writeValueAsString(rentBookRequest))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isCreated());
    }

    @Test
    public void rentBookJustBeforeAfterFirstOne() throws Exception {
        rentBook();
        RentBookRequest rentBookRequest = new RentBookRequest(1L, InitializationConfig.getDate(currentYear, currentMonth, currentDay + 5), 2L);
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/books")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .content(objectMapper.writeValueAsString(rentBookRequest))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound());
    }

    @Test
    public void rentBookJustAfterFirstOne() throws Exception {
        rentBook();
        RentBookRequest rentBookRequest = new RentBookRequest(1L, InitializationConfig.getDate(currentYear, currentMonth, currentDay + 6), 2L);
        System.out.println(objectMapper.writeValueAsString(rentBookRequest));
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/books")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .content(objectMapper.writeValueAsString(rentBookRequest))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isCreated());
    }


    int currentYear = Calendar.getInstance().get(Calendar.YEAR);
    int currentMonth = Calendar.getInstance().get(Calendar.MONTH);
    int currentDay = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
}
