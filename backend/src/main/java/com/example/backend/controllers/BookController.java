package com.example.backend.controllers;

import com.example.backend.models.Book;
import com.example.backend.models.BookInventory;
import com.example.backend.models.RentedBook;
import com.example.backend.models.User;
import com.example.backend.models.dtos.RentBookRequest;
import com.example.backend.repositories.BookInventoryRepository;
import com.example.backend.repositories.BookRepository;
import com.example.backend.repositories.RentedBookRepository;
import com.example.backend.services.RentBookService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/books")
public class BookController {

    private final BookRepository bookRepository;
    private final RentBookService rentBookService;

    @GetMapping
    public List<Book> getAll() {
        return bookRepository.findAll();
    }

    @PostMapping
    public ResponseEntity<Void> rentBook(@AuthenticationPrincipal User user, @RequestBody @Valid RentBookRequest rentBookRequest) throws ErrorController.BadRequest, ErrorController.NotFoundException {
        Instant instant = Instant.ofEpochMilli(rentBookRequest.getStartDateTimestamp());
        Date newDate = Date.from(instant);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(newDate);
        calendar.set(Calendar.MILLISECOND, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.HOUR, 0);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        RentedBook rentedBook = rentBookService.rentBook(user, rentBookRequest.toBuilder().startDateTimestamp(calendar.getTimeInMillis()).build());
        if (rentedBook == null) {
            throw new ErrorController.NotFoundException();
        }
        return ResponseEntity.status(HttpStatus.CREATED).build();
    }


}

