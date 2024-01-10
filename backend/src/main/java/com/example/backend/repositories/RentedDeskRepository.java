package com.example.backend.repositories;

import com.example.backend.models.*;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RentedDeskRepository extends JpaRepository<RentedDesk, RentedDeskId> {
    List<RentedDesk> findByDesk(Desk desk);
}
