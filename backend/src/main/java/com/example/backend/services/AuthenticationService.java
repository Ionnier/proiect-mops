package com.example.backend.services;

import com.example.backend.models.User;
import com.example.backend.models.dtos.SignupRequest;
import com.example.backend.models.mappers.UserMapper;
import com.example.backend.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthenticationService {
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final AuthenticationManager authenticationManager;
    private final UserRepository userRepository;
    private final UserMapper mapper;

    public String signUp(SignupRequest signupRequest) {
        User user = mapper.convert(signupRequest);
        user.obfuscatePassword(passwordEncoder);
        user.isAdmin = false;
        userRepository.save(user);
        return jwtService.generateToken(user.getUsername());
    }
}