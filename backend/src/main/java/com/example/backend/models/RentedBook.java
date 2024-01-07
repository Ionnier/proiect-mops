package com.example.backend.models;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Data
@NoArgsConstructor
public class RentedBook {
    @EmbeddedId
    public RentedBookMMId id;

    @ManyToOne
    @MapsId("userId")
    @OnDelete(action = OnDeleteAction.CASCADE)
    public User user;


    public RentedBook(User user, BookInventory bookInventory, Long dueDate, Long fromDate) {
        this.user = user;
        this.bookInventory = bookInventory;
        id = new RentedBookMMId(bookInventory.inventoryId, user.id, fromDate);
        this.dueDate = dueDate;
        this.isAllowed = true;
        this.state = BookRentalState.PREPARING;
    }

    @ManyToOne
    @MapsId("inventoryId")
    @OnDelete(action = OnDeleteAction.CASCADE)
    public BookInventory bookInventory;
    public BookRentalState state;
    public Long dueDate;
    public Boolean isAllowed;
}
