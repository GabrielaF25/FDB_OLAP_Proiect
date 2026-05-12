package com.healthcare.mongo_service.repository;

import com.healthcare.mongo_service.entity.Feedback;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FeedbackRepository extends MongoRepository<Feedback, String> {
    List<Feedback> findByPatientId(Long patientId);
    List<Feedback> findByDoctorId(Long doctorId);
}