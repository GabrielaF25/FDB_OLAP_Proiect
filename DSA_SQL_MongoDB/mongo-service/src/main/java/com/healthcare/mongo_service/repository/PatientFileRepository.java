package com.healthcare.mongo_service.repository;

import com.healthcare.mongo_service.entity.PatientFile;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PatientFileRepository extends MongoRepository<PatientFile, String> {
    PatientFile findByPatientId(Long patientId);
}