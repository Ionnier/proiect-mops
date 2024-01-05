package com.example.backend.controllers;

import com.example.backend.models.dtos.SignupRequest;
import com.example.backend.models.responses.AuthResponse;
import com.example.backend.services.AuthenticationService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
public class AuthController {
    private final AuthenticationService authenticationService;

    @PostMapping("/api/signup")
    public AuthResponse registerUser(@RequestBody @Valid SignupRequest signupRequest) {
        return new AuthResponse(authenticationService.signUp(signupRequest));
    }
}

