package com.example.backend.models;

import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Embeddable
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RentedDeskId {
    public Long deskId;
    public Long userId;
    public Long createdAt;
}

