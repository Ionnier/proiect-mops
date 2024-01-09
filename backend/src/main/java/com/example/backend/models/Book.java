package com.example.backend.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.data.rest.core.annotation.RestResource;

@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Book {
    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE)
    public Long bookId;

    @NotNull
    public String name;

    @NotNull
    public String category;

    @NotNull
    public Long releaseDateMillis;

    @ManyToOne
    @JoinColumn(name="authorId", nullable=false, updatable=false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @RestResource(path = "authorId")
    public Author author;
}
