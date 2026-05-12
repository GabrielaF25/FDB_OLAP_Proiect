package com.healthcare.mongo_service.controller;

import com.healthcare.mongo_service.entity.PatientFile;
import com.healthcare.mongo_service.repository.PatientFileRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/patient-files")
public class PatientFileController {

    @Autowired
    private PatientFileRepository patientFileRepository;

    @GetMapping
    public List<PatientFile> getAll() {
        return patientFileRepository.findAll();
    }

    @GetMapping("/patient/{patientId}")
    public PatientFile getByPatientId(@PathVariable Long patientId) {
        return patientFileRepository.findByPatientId(patientId);
    }
}