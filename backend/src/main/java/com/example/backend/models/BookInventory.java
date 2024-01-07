package com.example.backend.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@AllArgsConstructor
@NoArgsConstructor
public class BookInventory {

    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE)
    public Long inventoryId;

    public String state;

    @ManyToOne
    @JoinColumn(name="bookId", nullable=false, updatable=false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    public Book book;

}
