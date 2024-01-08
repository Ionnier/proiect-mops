package com.example.backend.controller;

import com.example.backend.BaseTestClass;
import com.example.backend.models.RentedBook;
import com.example.backend.models.responses.DeskResponse;
import com.example.backend.utils.AuthenticationTestUtils;
import com.fasterxml.jackson.core.type.TypeReference;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import java.util.List;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class DesksControllerTests extends BaseTestClass {
    @Autowired
    AuthenticationTestUtils authenticationTestUtils;

    @Test
    void getAllAsAnonymousFails() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .get("/api/desks")
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isForbidden());
    }

    @Test
    void getAllAsUserWorks() throws Exception {
        MvcResult mvcResult = mvc.perform(MockMvcRequestBuilders
                        .get("/api/desks")
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk()).andReturn();
        List<DeskResponse> desks = objectMapper.readValue(mvcResult.getResponse().getContentAsString(), new TypeReference<>() {
        });
        assert desks.size() != 0;

    }

    @Test
    void getDeskImageWorks() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .get("/desk1.png"))
                .andExpect(status().isOk());
    }

}
