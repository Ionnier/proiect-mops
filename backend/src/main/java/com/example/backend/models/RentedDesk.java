package com.example.backend.models;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Data
@NoArgsConstructor
public class RentedDesk {
    @EmbeddedId
    public RentedDeskId id;

    @ManyToOne
    @MapsId("userId")
    @OnDelete(action = OnDeleteAction.CASCADE)
    public User user;

    public RentedDesk(User user, Desk desk, Long dueDate, Long fromDate) {
        this.user = user;
        this.desk = desk;
        id = new RentedDeskId(desk.id, user.id, fromDate);
        this.dueDate = dueDate;
        this.isAllowed = true;
    }

    @ManyToOne
    @MapsId("deskId")
    @OnDelete(action = OnDeleteAction.CASCADE)
    public Desk desk;

    public Long dueDate;

    public Boolean isAllowed;
}

