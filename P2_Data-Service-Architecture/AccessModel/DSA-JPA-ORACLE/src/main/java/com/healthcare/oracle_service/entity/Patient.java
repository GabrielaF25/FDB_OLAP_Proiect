package com.healthcare.oracle_service.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "PATIENTS")
public class Patient {

    @Id
    @Column(name = "PATIENT_ID")
    private Long patientId;

    @Column(name = "NAME")
    private String name;

    @Column(name = "AGE")
    private Integer age;

    @Column(name = "GENDER")
    private String gender;

    @Column(name = "PHONE")
    private String phone;

    public Long getPatientId() { return patientId; }
    public void setPatientId(Long patientId) { this.patientId = patientId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public Integer getAge() { return age; }
    public void setAge(Integer age) { this.age = age; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
}