package com.example.backend.services;

import com.example.backend.controllers.ErrorController;
import com.example.backend.models.Book;
import com.example.backend.models.BookInventory;
import com.example.backend.models.RentedBook;
import com.example.backend.models.User;
import com.example.backend.models.dtos.RentBookRequest;
import com.example.backend.repositories.BookInventoryRepository;
import com.example.backend.repositories.BookRepository;
import com.example.backend.repositories.RentedBookRepository;
import jakarta.annotation.Nullable;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Service
@AllArgsConstructor
public class RentBookService {
    private final RentedBookRepository rentedBookRepository;
    private final BookInventoryRepository bookInventoryRepository;
    private final BookRepository bookRepository;

    @Nullable
    public RentedBook rentBook(User user, RentBookRequest rentBookRequest) throws ErrorController.BadRequest, ErrorController.NotFoundException {
        if (Instant.ofEpochMilli(rentBookRequest.getStartDateTimestamp()).isBefore(Instant.now())) {
            throw new ErrorController.BadRequest();
        }

        Book requestedBook = bookRepository.findById(rentBookRequest.getBookId()).orElseThrow(ErrorController.NotFoundException::new);

        List<BookInventory> allBooks = bookInventoryRepository.findByBook(requestedBook);

        Instant desiredStartTimestamp = Instant.ofEpochMilli(rentBookRequest.getStartDateTimestamp());
        Instant desiredEndTimestamp = desiredStartTimestamp.plusMillis(TimeUnit.DAYS.toMillis(rentBookRequest.getNumberOfDays()));

        BookInventory availableInventory = null;
        for (BookInventory bookInventory: allBooks) {
            List<RentedBook> currentReservations = rentedBookRepository.findByBookInventory(bookInventory);
            boolean isAvailable = true;
            for (RentedBook reservation : currentReservations) {
                if (!checkValidInterval(desiredStartTimestamp, desiredEndTimestamp, reservation.getId().createdAt, reservation.dueDate)) {
                    isAvailable = false;
                    break;
                }
            }
            if (!isAvailable) {
                continue;
            }
            availableInventory =  bookInventory;
            break;
        }

        if (availableInventory == null) {
            return null;
        }

        return rentedBookRepository.save(new RentedBook(user, availableInventory, desiredEndTimestamp.toEpochMilli(), desiredStartTimestamp.toEpochMilli()));
    }

    public static boolean checkValidInterval(Instant desiredStartTimestamp, Instant desiredEndTimestamp, Long startTimeStamp, Long endTimeStamp) {
        Instant reservationStartTimestamp = Instant.ofEpochMilli(startTimeStamp);
        Instant reservationEndTimestamp = Instant.ofEpochMilli(endTimeStamp);

        if (desiredStartTimestamp.compareTo(reservationStartTimestamp) == 0) {
            return false;
        }

        if (desiredEndTimestamp.compareTo(reservationEndTimestamp) == 0) {
            return false;
        }

        if (desiredStartTimestamp.isAfter(reservationStartTimestamp) && desiredStartTimestamp.isBefore(reservationEndTimestamp)) {
            return false;
        }
        if (desiredEndTimestamp.isAfter(reservationStartTimestamp) && desiredEndTimestamp.isBefore(reservationEndTimestamp)) {
            return false;
        }

        if (desiredStartTimestamp.isBefore(reservationStartTimestamp) && desiredEndTimestamp.isAfter(reservationEndTimestamp)) {
            return false;
        }

        return true;
    }
}
