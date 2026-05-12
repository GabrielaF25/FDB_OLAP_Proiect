package com.healthcare.mongo_service.controller;

import com.healthcare.mongo_service.entity.Feedback;
import com.healthcare.mongo_service.repository.FeedbackRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/feedback")
public class FeedbackController {

    @Autowired
    private FeedbackRepository feedbackRepository;

    @GetMapping
    public List<Feedback> getAll() {
        return feedbackRepository.findAll();
    }

    @GetMapping("/patient/{patientId}")
    public List<Feedback> getByPatient(@PathVariable Long patientId) {
        return feedbackRepository.findByPatientId(patientId);
    }

    @GetMapping("/doctor/{doctorId}")
    public List<Feedback> getByDoctor(@PathVariable Long doctorId) {
        return feedbackRepository.findByDoctorId(doctorId);
    }
}