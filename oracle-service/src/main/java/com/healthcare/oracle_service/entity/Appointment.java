package com.healthcare.oracle_service.entity;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "APPOINTMENTS")
public class Appointment {

    @Id
    @Column(name = "APPOINTMENT_ID")
    private Long appointmentId;

    @Column(name = "PATIENT_ID")
    private Long patientId;

    @Column(name = "DOCTOR_ID")
    private Long doctorId;

    @Column(name = "APPOINTMENT_DATE")
    private Date appointmentDate;

    @Column(name = "STATUS")
    private String status;

    public Long getAppointmentId() { return appointmentId; }
    public void setAppointmentId(Long id) { this.appointmentId = id; }

    public Long getPatientId() { return patientId; }
    public void setPatientId(Long patientId) { this.patientId = patientId; }

    public Long getDoctorId() { return doctorId; }
    public void setDoctorId(Long doctorId) { this.doctorId = doctorId; }

    public Date getAppointmentDate() { return appointmentDate; }
    public void setAppointmentDate(Date d) { this.appointmentDate = d; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}