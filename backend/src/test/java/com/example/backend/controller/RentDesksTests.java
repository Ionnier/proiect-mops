package com.example.backend.controller;

import com.example.backend.BaseTestClass;
import com.example.backend.models.dtos.Interval;
import com.example.backend.models.dtos.RentDeskRequest;
import com.example.backend.repositories.RentedDeskRepository;
import com.example.backend.utils.AuthenticationTestUtils;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.util.Calendar;
import java.util.List;
import java.util.concurrent.TimeUnit;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class RentDesksTests extends BaseTestClass {
    @Autowired
    AuthenticationTestUtils authenticationTestUtils;

    RentDeskRequest getRequest() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DAY_OF_MONTH, 1);
        calendar.set(Calendar.HOUR, 10);
        long millis = calendar.getTimeInMillis();
        return new RentDeskRequest(2L, List.of(new Interval(millis, millis + TimeUnit.HOURS.toMillis(1))));
    }

    RentDeskRequest getRequestWith2Intervals() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DAY_OF_MONTH, 1);
        calendar.set(Calendar.HOUR, 10);
        long millis = calendar.getTimeInMillis();
        return new RentDeskRequest(2L, List.of(new Interval(millis, millis + TimeUnit.HOURS.toMillis(1)), new Interval(millis + TimeUnit.HOURS.toMillis(1), millis + TimeUnit.HOURS.toMillis(2))));
    }

    @Test
    void rentDeskAsAnonymousFails() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/desks")
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isForbidden());
    }

    @Test
    void rentDeskAsUserWorksWithEmptyIntevalListIsBadRequest() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/desks")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .content(objectMapper.writeValueAsString(getRequest().toBuilder().intervals(List.of()).build()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isBadRequest());
    }

    @Test
    void rentDeskAsUserWorksWithNullIntervalListIsBadRequest() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/desks")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .content(objectMapper.writeValueAsString(getRequest().toBuilder().intervals(null).build()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isBadRequest());

    }

    @Test
    void rentDeskWithNullDeskIdIsBadRequest() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/desks")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .content(objectMapper.writeValueAsString(getRequest().toBuilder().deskId(null).build()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isBadRequest());
    }

    @Test
    void rentDeskWithValidIntervalReturnsOk() throws Exception {
        long initialSize = rentedDeskRepository.count();
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/desks")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .content(objectMapper.writeValueAsString(getRequest()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
        assert initialSize + 1 == rentedDeskRepository.count();
    }

    @Test
    void rentDeskWithDoubleFailsWithBadRequest() throws Exception {
        rentDeskWithValidIntervalReturnsOk();
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/desks")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .content(objectMapper.writeValueAsString(getRequest()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isBadRequest());
    }

    @Test
    void rentDeskWithMultipleIntervalsWork() throws Exception {
        long initialSize = rentedDeskRepository.count();
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/desks")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .content(objectMapper.writeValueAsString(getRequestWith2Intervals()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
        assert initialSize + 2 == rentedDeskRepository.count();
    }

    @Test
    void rentDeskWithNotAllIntervalsValidFails() throws Exception {
        rentDeskWithValidIntervalReturnsOk();
        long initialSize = rentedDeskRepository.count();
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/desks")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .content(objectMapper.writeValueAsString(getRequestWith2Intervals()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isBadRequest());
        assert initialSize == rentedDeskRepository.count();
    }

    @Test
    void rentDeskNullId() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .get("/api/desks/30")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound());
    }

    @Test
    void rentDeskFound() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .get("/api/desks/1")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
    }

    @Test
    void rentDeskInvalidId() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .get("/api/desks/asd")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isBadRequest());
    }


}
