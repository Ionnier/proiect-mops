package com.example.backend.controller;

import com.example.backend.models.dtos.LoginRequest;
import com.example.backend.models.dtos.SignupRequest;
import com.example.backend.models.responses.AuthResponse;
import com.example.backend.repositories.UserRepository;
import com.example.backend.utils.AuthenticationTestUtils;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Objects;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@DirtiesContext(classMode = DirtiesContext.ClassMode.BEFORE_EACH_TEST_METHOD)
public class AuthControllerTests {
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

    public final SignupRequest validSignUpRequest = new SignupRequest("asd@cti.ro", "asdasdasdsadsa", "asdasdas", "FirstName", "LastName", "addressada");
    public final LoginRequest validLoginRequest = new LoginRequest(validSignUpRequest.email, validSignUpRequest.password);

    @Test
    public void testValidSignUp() throws Exception {
        long initialSize = userRepository.findAll().size();
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/signup")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .content(objectMapper.writeValueAsString(validSignUpRequest))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
        assert userRepository.findAll().size() == initialSize + 1;
    }

    @Test
    public void testMissingAttributesSignup() throws Exception {
        List<SignupRequest> list = List.of(
            validSignUpRequest.toBuilder().email(null).build(),
            validSignUpRequest.toBuilder().ssn(null).build(),
            validSignUpRequest.toBuilder().address(null).build(),
            validSignUpRequest.toBuilder().password(null).build(),
            validSignUpRequest.toBuilder().lastName(null).build(),
            validSignUpRequest.toBuilder().firstName(null).build()
        );
        for (SignupRequest element: list) {
            System.out.println(element);
            mvc.perform(MockMvcRequestBuilders
                            .post("/api/signup")
                            .characterEncoding(StandardCharsets.UTF_8)
                            .content(objectMapper.writeValueAsString(element))
                            .contentType(MediaType.APPLICATION_JSON)
                            .accept(MediaType.APPLICATION_JSON))
                    .andExpect(status().isBadRequest());
        }
    }

    @Test
    public void testDuplicateMailSignup() throws Exception {
        testValidSignUp();
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/signup")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .content(objectMapper.writeValueAsString(validSignUpRequest.toBuilder().ssn("asdasdasd").build()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isBadRequest());
    }

    @Test
    public void testDuplicateSSNSignup() throws Exception {
        testValidSignUp();
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/signup")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .content(objectMapper.writeValueAsString(validSignUpRequest.toBuilder().email("asdasdasd@asd.com").build()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isBadRequest());
    }

    @Test
    public void testLogin() throws Exception {
        testValidSignUp();
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/login")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .content(objectMapper.writeValueAsString(validLoginRequest))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
    }

    @Test
    public void testLoginNoUser() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/login")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .content(objectMapper.writeValueAsString(validLoginRequest))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound());
    }

    @Test
    public void testLoginWrongEmail() throws Exception {
        testValidSignUp();
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/login")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .content(objectMapper.writeValueAsString(validLoginRequest.toBuilder().email("hey@cti.ro").build()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound());
    }

    @Test
    public void testLoginBadEmail() throws Exception {
        testValidSignUp();
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/login")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .content(objectMapper.writeValueAsString(validLoginRequest.toBuilder().email("heyctiro").build()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isBadRequest());
    }

    @Test
    public void testRequestJSONMatches() throws Exception {
        Path signUpResponse = Path.of(stubsPath.toString(), "auth", "signup.json");
        assert Objects.equals(objectMapper.readTree(objectMapper.writeValueAsString(new AuthResponse("gibberishjwt"))),objectMapper.readTree(Files.readAllBytes(signUpResponse)));
    }


}
