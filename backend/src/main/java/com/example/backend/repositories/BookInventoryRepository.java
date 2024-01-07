package com.example.backend.repositories;

import com.example.backend.models.Book;
import com.example.backend.models.BookInventory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookInventoryRepository extends JpaRepository<BookInventory, Long> {
    List<BookInventory> findByBook(Book book);
}
