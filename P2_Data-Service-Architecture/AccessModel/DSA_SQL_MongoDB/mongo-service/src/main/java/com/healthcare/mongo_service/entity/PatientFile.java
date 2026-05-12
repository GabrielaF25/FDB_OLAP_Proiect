package com.healthcare.mongo_service.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import java.util.List;

@Document(collection = "patiences_file")
public class PatientFile {

    @Id
    private String id;

    @Field("patient_id")
    private Long patientId;

    private List<String> allergies;

    @Field("chronic_conditions")
    private List<String> chronicConditions;

    @Field("medication_history")
    private List<Object> medicationHistory;

    @Field("appointment_preferences")
    private String appointmentPreferences;

    private String notes;

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public Long getPatientId() { return patientId; }
    public void setPatientId(Long patientId) { this.patientId = patientId; }

    public List<String> getAllergies() { return allergies; }
    public void setAllergies(List<String> allergies) { this.allergies = allergies; }

    public List<String> getChronicConditions() { return chronicConditions; }
    public void setChronicConditions(List<String> chronicConditions) { this.chronicConditions = chronicConditions; }

    public List<Object> getMedicationHistory() { return medicationHistory; }
    public void setMedicationHistory(List<Object> medicationHistory) { this.medicationHistory = medicationHistory; }

    public String getAppointmentPreferences() { return appointmentPreferences; }
    public void setAppointmentPreferences(String appointmentPreferences) { this.appointmentPreferences = appointmentPreferences; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }
}