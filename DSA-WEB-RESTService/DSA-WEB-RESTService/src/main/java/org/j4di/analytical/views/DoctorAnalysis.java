package org.j4di.analytical.views;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "vw_olap_doctor_analysis")
@Data
public class DoctorAnalysis {
    @Id
    @Column(name = "doctor_name")
    private String doctorName;

    private String specialization;

    @Column(name = "total_appointments")
    private Long totalAppointments;

    @Column(name = "unique_patients")
    private Long uniquePatients;

    @Column(name = "completed_cases")
    private Long completedCases;

    @Column(name = "avg_patient_age")
    private Double avgPatientAge;
}