package com.example.backend.utils;


import com.example.backend.configuration.InitializationConfig;
import com.example.backend.controller.AuthControllerTests;
import com.example.backend.models.User;
import com.example.backend.models.dtos.LoginRequest;
import com.example.backend.models.dtos.SignupRequest;
import com.example.backend.repositories.UserRepository;
import com.example.backend.services.AuthenticationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;

@Service
public class AuthenticationTestUtils {
    @Autowired
    private AuthenticationService authenticationService;

    @Autowired
    private AuthControllerTests authControllerTests;

    @Autowired
    private UserRepository userRepository;

    public String authorization = "Authorization";

    public String user() throws Exception {
        if (userRepository.findByEmail(authControllerTests.validSignUpRequest.email) == null) {
            try {
                authControllerTests.testValidSignUp();
            } catch (Exception e) {
                throw e;
            }
        }
        return "Bearer " + authenticationService.login(authControllerTests.validLoginRequest);
    }

    public String admin() throws Exception {
        return "Bearer " + authenticationService.login(new LoginRequest(InitializationConfig.ADMIN_EMAIL, InitializationConfig.ADMIN_PASSWORD));
    }

}
