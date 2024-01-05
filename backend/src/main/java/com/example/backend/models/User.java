package com.example.backend.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Collection;
import java.util.List;

@Entity(name = "users")
@Table(
    uniqueConstraints= {
        @UniqueConstraint(columnNames={"id"}),
        @UniqueConstraint(columnNames={"email"}),
        @UniqueConstraint(columnNames={"ssn"}),
    }
)
@JsonIgnoreProperties("authorities")
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id;
    @Email
    @NotBlank
    public String email;
    @NotBlank
    public String ssn;
    @NotBlank
    public String password;
    @NotBlank
    public String firstName;
    @NotBlank
    public String lastName;
    @Size(min = 5)
    public String address;

    @NotNull
    public boolean isAdmin = false;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        String role = (isAdmin)?"ROLE_ADMIN":"ROLE_USER";
        return List.of(new SimpleGrantedAuthority(role));
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    public void obfuscatePassword(PasswordEncoder passwordEncoder) {
        this.password = passwordEncoder.encode(password);
    }
}
