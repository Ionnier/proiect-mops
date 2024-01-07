package com.example.backend.repositories;

import com.example.backend.models.Book;
import com.example.backend.models.Review;
import com.example.backend.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ReviewRepository extends JpaRepository<Review, Long> {
    List<Review> findByCreatedByAndCreatedFor(User user, Book book);
}