package com.example.backend.models;

import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Embeddable
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RentedBookMMId {
    public Long inventoryId;
    public Long userId;
    public Long createdAt;
}
