package com.example.backend.models.dtos;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
@Builder(toBuilder = true)
public class RentBookRequest {
    @NotNull
    Long bookId;

    @NotNull
    Long startDateTimestamp;

    @NotNull
    Long numberOfDays;
}
