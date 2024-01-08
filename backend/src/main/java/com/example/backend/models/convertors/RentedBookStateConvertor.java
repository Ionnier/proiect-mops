package com.example.backend.models.convertors;

import com.example.backend.models.BookRentalState;
import org.springframework.stereotype.Component;
import org.springframework.core.convert.converter.Converter;

@Component
public class RentedBookStateConvertor implements Converter<String, BookRentalState> {
    @Override
    public BookRentalState convert(String type) {
        for (BookRentalState value: BookRentalState.values()) {
            if (type.trim().equalsIgnoreCase(value.name())) {
                return value;
            }
        }
        return null;
    }
}
