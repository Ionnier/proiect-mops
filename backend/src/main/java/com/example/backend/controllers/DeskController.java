package com.example.backend.controllers;

import com.example.backend.models.responses.DeskResponse;
import com.example.backend.repositories.DeskRepository;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@AllArgsConstructor
@RequestMapping("/api/desks")
public class DeskController {
    final DeskRepository deskRepository;

    @GetMapping
    public List<DeskResponse> getAll() {
        return deskRepository.findAll().stream().map(DeskResponse::new).collect(Collectors.toList());
    }
}
