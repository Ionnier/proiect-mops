package com.example.backend.controllers;

import com.example.backend.models.Book;
import com.example.backend.repositories.BookRepository;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/books")
public class BookController {

    private final BookRepository bookRepository;

    @GetMapping
    public List<Book> getAll() {
        return bookRepository.findAll();
    }

}

