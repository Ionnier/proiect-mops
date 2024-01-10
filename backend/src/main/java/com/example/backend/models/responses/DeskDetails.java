package com.example.backend.models.responses;

import com.example.backend.models.Desk;
import com.example.backend.models.dtos.Interval;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DeskDetails {
    Desk desk;
    List<Interval> reservedIntervals;
}
