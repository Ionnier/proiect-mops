package com.example.backend.controllers;

import com.example.backend.models.Desk;
import com.example.backend.models.RentedBook;
import com.example.backend.models.RentedDesk;
import com.example.backend.models.User;
import com.example.backend.models.dtos.Interval;
import com.example.backend.models.dtos.RentBookRequest;
import com.example.backend.models.dtos.RentDeskRequest;
import com.example.backend.models.responses.DeskResponse;
import com.example.backend.repositories.DeskRepository;
import com.example.backend.repositories.RentedDeskRepository;
import com.example.backend.services.RentBookService;
import jakarta.transaction.Transactional;
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
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

@RestController
@AllArgsConstructor
@RequestMapping("/api/desks")
public class DeskController {
    final DeskRepository deskRepository;
    final RentedDeskRepository rentedDeskRepository;

    @GetMapping
    public List<DeskResponse> getAll() {
        return deskRepository.findAll().stream().map(DeskResponse::new).collect(Collectors.toList());
    }

    @PostMapping
    @Transactional
    public ResponseEntity<Void> rentDeskWith(@AuthenticationPrincipal User user, @RequestBody @Valid RentDeskRequest rentDeskRequest) throws Exception {
        if (rentDeskRequest.getIntervals().size() == 0) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }

        Desk desk = deskRepository.findById(rentDeskRequest.getDeskId()).orElseThrow(ErrorController.NotFoundException::new);

        List<RentedDesk> rentedDesks = rentedDeskRepository.findByDesk(desk);

        List<RentedDesk> toAddDesks = new java.util.ArrayList<>(List.of());

        for (Interval interval: rentDeskRequest.getIntervals()) {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(BookController.getDate(interval.getStartTimestamp()));
            calendar.set(Calendar.MILLISECOND, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MINUTE, 0);

            Instant desiredStartTimestamp = Instant.ofEpochMilli(calendar.getTimeInMillis());

            calendar.setTime(BookController.getDate(interval.getEndTimestamp()));
            calendar.set(Calendar.MILLISECOND, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MINUTE, 0);
            Instant desiredEndTimestamp = Instant.ofEpochMilli(calendar.getTimeInMillis());

            for (RentedDesk rentedDesk: rentedDesks) {
                System.out.println(rentedDesk);
                System.out.println(interval);
                if (!RentBookService.checkValidInterval(desiredStartTimestamp, desiredEndTimestamp, rentedDesk.getId().createdAt, rentedDesk.dueDate)) {
                    return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
                }
            }

            toAddDesks.add(new RentedDesk(user, desk, interval.getStartTimestamp(), interval.getEndTimestamp()));
        }

        rentedDeskRepository.saveAll(toAddDesks);

        return ResponseEntity.status(HttpStatus.OK).build();
    }
}
