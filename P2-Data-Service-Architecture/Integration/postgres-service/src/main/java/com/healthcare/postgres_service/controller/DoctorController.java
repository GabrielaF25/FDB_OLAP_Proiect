package com.healthcare.postgres_service.controller;

import com.healthcare.postgres_service.entity.Doctor;
import com.healthcare.postgres_service.repository.DoctorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/doctors")
public class DoctorController {

    @Autowired
    private DoctorRepository doctorRepository;

    @GetMapping
    public List<Doctor> getAll() {
        return doctorRepository.findAll();
    }

    @GetMapping("/{id}")
    public Doctor getById(@PathVariable Long id) {
        return doctorRepository.findById(id).orElse(null);
    }

    @GetMapping("/clinic/{clinicId}")
    public List<Doctor> getByClinic(@PathVariable Long clinicId) {
        return doctorRepository.findByClinicId(clinicId);
    }
}