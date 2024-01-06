package com.example.backend.models.mappers;

import com.example.backend.models.User;
import com.example.backend.models.dtos.SignupRequest;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface UserMapper {
    User convert(SignupRequest loginRequest);
}
