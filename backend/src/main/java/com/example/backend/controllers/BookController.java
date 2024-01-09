package com.example.backend.controllers;

import com.example.backend.models.*;
import com.example.backend.models.dtos.RentBookRequest;
import com.example.backend.models.dtos.ReviewRequest;
import com.example.backend.repositories.BookRepository;
import com.example.backend.repositories.RentedBookRepository;
import com.example.backend.repositories.ReviewRepository;
import com.example.backend.services.RentBookService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@RestController
@AllArgsConstructor
@RequestMapping("/api/books")
public class BookController {

    private final BookRepository bookRepository;
    private final RentBookService rentBookService;
    private final RentedBookRepository rentedBookRepository;
    private final ReviewRepository reviewRepository;

    @GetMapping
    public List<Book> getAll() {
        return bookRepository.findAll();
    }

    @PostMapping
    public ResponseEntity<Void> rentBook(@AuthenticationPrincipal User user, @RequestBody @Valid RentBookRequest rentBookRequest) throws ErrorController.BadRequest, ErrorController.NotFoundException {
        Date newDate = getDate(rentBookRequest.getStartDateTimestamp());
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

    public static Date getDate(Long millis) {
        Instant instant = Instant.ofEpochMilli(millis);
        Date newDate = Date.from(instant);
        return newDate;
    }

    @PostMapping("/reviews")
    public ResponseEntity<Object> reviewBook(@AuthenticationPrincipal User user, @RequestBody @Valid ReviewRequest reviewRequest) throws Exception {
        Book createdFor = bookRepository.findById(reviewRequest.getBookId()).orElseThrow(ErrorController.NotFoundException::new);
        List<Review> reviewWroteFor = reviewRepository.findByCreatedByAndCreatedFor(user, createdFor);

        if (reviewWroteFor.size() != 0) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }

        if (rentedBookRepository.findAll().stream().noneMatch(e -> Objects.equals(e.bookInventory.book.bookId, createdFor.bookId) && Objects.equals(e.user.id, user.id) && Objects.equals(e.state, BookRentalState.RETURNED))) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }

        return ResponseEntity.status(HttpStatus.CREATED).body(reviewRepository.save(new Review(null, Instant.now().toEpochMilli(), reviewRequest.getContent(), user, createdFor)));
    }


}

