package org.j4di.analytical.views;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "vw_olap_specialization_analysis")
@Data
public class SpecializationAnalysis {
    @Id
    private String specialization;

    @Column(name = "total_appointments")
    private Long totalAppointments;

    @Column(name = "unique_patients")
    private Long uniquePatients;

    @Column(name = "average_patient_age")
    private Double averagePatientAge;

    @Column(name = "completed_appointments")
    private Long completedAppointments;

    @Column(name = "cancelled_appointments")
    private Long cancelledAppointments;
}