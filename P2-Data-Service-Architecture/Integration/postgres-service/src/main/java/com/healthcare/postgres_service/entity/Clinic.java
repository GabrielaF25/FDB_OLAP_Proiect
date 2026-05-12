package com.healthcare.postgres_service.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "clinics")
public class Clinic {

    @Id
    @Column(name = "clinic_id")
    private Long clinicId;

    @Column(name = "name")
    private String name;

    @Column(name = "location")
    private String location;

    public Long getClinicId() { return clinicId; }
    public void setClinicId(Long clinicId) { this.clinicId = clinicId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }
}