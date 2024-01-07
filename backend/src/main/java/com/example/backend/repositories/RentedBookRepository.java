package com.example.backend.repositories;

import com.example.backend.models.BookInventory;
import com.example.backend.models.RentedBook;
import com.example.backend.models.RentedBookMMId;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RentedBookRepository extends JpaRepository<RentedBook, RentedBookMMId> {
    List<RentedBook> findByBookInventory(BookInventory bookInventory);
}
