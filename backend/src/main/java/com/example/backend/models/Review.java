package com.example.backend.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.LocalDateTime;
import java.time.ZoneOffset;

@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    public Long reviewId;

    public Long createdAt;

    public String content;

    @ManyToOne
    @JoinColumn(name="id", nullable=false, updatable=false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    public User createdBy;

    @ManyToOne
    @JoinColumn(name="bookId", nullable=false, updatable=false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    public Book createdFor;

    @PrePersist
    void prePersist() {
        this.createdAt = System.currentTimeMillis();
    }
}
