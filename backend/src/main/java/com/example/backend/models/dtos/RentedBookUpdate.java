package com.example.backend.models.dtos;

import com.example.backend.models.BookRentalState;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class RentedBookUpdate {
    @NotNull
    public Long inventoryId;
    @NotNull
    public Long userId;
    @NotNull
    public Long createdAt;
    @NotNull
    public BookRentalState state;
}
