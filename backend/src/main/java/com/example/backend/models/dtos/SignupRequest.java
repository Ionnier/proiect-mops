package com.example.backend.models.dtos;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
@Builder(toBuilder = true)
public class SignupRequest {
    @Email
    @NotBlank
    public String email;

    @NotBlank
    @Size(min = 8)
    public String password;

    @NotBlank
    public String ssn;

    @NotBlank
    public String firstName;

    @NotBlank
    public String lastName;

    @Size(min = 5)
    @NotNull
    public String address;
}

