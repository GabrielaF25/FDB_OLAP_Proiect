package org.j4di.analytical.views;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "vw_olap_clinic_performance")
@Data
public class ClinicPerformance {
    @Id
    @Column(name = "clinic_name")
    private String clinicName;

    @Column(name = "clinic_location")
    private String clinicLocation;

    @Column(name = "total_appointments")
    private Long totalAppointments;

    @Column(name = "total_doctors")
    private Long totalDoctors;

    @Column(name = "total_patients")
    private Long totalPatients;

    @Column(name = "avg_patient_age")
    private Double avgPatientAge;

    @Column(name = "completion_rate")
    private Double completionRate;
}