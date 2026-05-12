package org.j4di.analytical.views;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "vw_healthcare_analytics")
@Data
public class HealthcareAnalytics {

    @Id
    @Column(name = "patientId")
    private Long patientId;

    @Column(name = "patient_name")
    private String patientName;

    private Integer age;
    private String gender;

    @Column(name = "appointmentId")
    private Long appointmentId;

    @Column(name = "appointmentDate")
    private String appointmentDate;

    @Column(name = "appointment_status")
    private String appointmentStatus;

    @Column(name = "doctorId")
    private Long doctorId;

    @Column(name = "doctor_name")
    private String doctorName;

    private String specialization;

    @Column(name = "clinicId")
    private Long clinicId;

    @Column(name = "clinic_name")
    private String clinicName;

    @Column(name = "clinic_location")
    private String clinicLocation;

    private String occupation;

    @Column(name = "marital_status")
    private String maritalStatus;

    @Column(name = "blood_type")
    private String bloodType;

    @Column(name = "smoking_status")
    private String smokingStatus;

    @Column(name = "physical_activity")
    private String physicalActivity;

    @Column(name = "insurance_provider")
    private String insuranceProvider;

    private String transportation;
}