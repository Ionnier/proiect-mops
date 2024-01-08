package com.example.backend.models.mappers;

import com.example.backend.models.RentedBookMMId;
import com.example.backend.models.dtos.RentedBookUpdate;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface RentedBookIdMapper {
    RentedBookMMId convert(RentedBookUpdate request);
}
