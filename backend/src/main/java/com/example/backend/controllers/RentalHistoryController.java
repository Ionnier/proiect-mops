package com.example.backend.controllers;

import com.example.backend.models.RentedBook;
import com.example.backend.models.User;
import com.example.backend.repositories.RentedBookRepository;
import lombok.AllArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/rentals")
@AllArgsConstructor
public class RentalHistoryController {
    final RentedBookRepository rentedBookRepository;

    @GetMapping
    List<RentedBook> getAll(@AuthenticationPrincipal User user) {
        return rentedBookRepository.findByUser(user);
    }
}
