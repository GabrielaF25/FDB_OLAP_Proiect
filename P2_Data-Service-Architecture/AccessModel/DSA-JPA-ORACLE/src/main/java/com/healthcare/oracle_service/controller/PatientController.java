package com.healthcare.oracle_service.controller;

import com.healthcare.oracle_service.entity.Patient;
import com.healthcare.oracle_service.repository.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/patients")
public class PatientController {

    @Autowired
    private PatientRepository patientRepository;

    @GetMapping
    public List<Patient> getAll() {
        return patientRepository.findAll();
    }

    @GetMapping("/{id}")
    public Patient getById(@PathVariable Long id) {
        return patientRepository.findById(id).orElse(null);
    }
}