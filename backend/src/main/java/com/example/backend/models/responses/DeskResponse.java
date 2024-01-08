package com.example.backend.models.responses;

import com.example.backend.models.Desk;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DeskResponse {
    Long id;
    String location;

    public DeskResponse(Desk desk) {
        id = desk.id;
        location = "/desk" + desk.id + ".png";
    }
}
