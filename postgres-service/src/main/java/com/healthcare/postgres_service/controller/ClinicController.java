package com.healthcare.postgres_service.controller;

import com.healthcare.postgres_service.entity.Clinic;
import com.healthcare.postgres_service.repository.ClinicRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/clinics")
public class ClinicController {

    @Autowired
    private ClinicRepository clinicRepository;

    @GetMapping
    public List<Clinic> getAll() {
        return clinicRepository.findAll();
    }

    @GetMapping("/{id}")
    public Clinic getById(@PathVariable Long id) {
        return clinicRepository.findById(id).orElse(null);
    }
}