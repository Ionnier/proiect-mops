package com.example.backend.controllers;

import com.example.backend.models.RentedBook;
import com.example.backend.models.RentedBookMMId;
import com.example.backend.models.User;
import com.example.backend.models.dtos.RentedBookUpdate;
import com.example.backend.models.mappers.RentedBookIdMapper;
import com.example.backend.repositories.RentedBookRepository;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/data/rentals")
@AllArgsConstructor
public class RentalController {
    final RentedBookRepository rentedBookRepository;
    final RentedBookIdMapper rentedBookIdMapper;

    @GetMapping
    List<RentedBook> getAll() {
        return rentedBookRepository.findAll();
    }

    @PatchMapping
    void updateRentedBook(@Valid @RequestBody RentedBookUpdate rentedBookUpdate) throws Exception {
        RentedBookMMId id = rentedBookIdMapper.convert(rentedBookUpdate);
        RentedBook rentedBook = rentedBookRepository.findById(id).orElseThrow(ErrorController.NotFoundException::new);
        rentedBook.state = rentedBookUpdate.state;
        rentedBookRepository.save(rentedBook);
    }
}
