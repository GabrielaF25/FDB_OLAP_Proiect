CREATE OR REPLACE VIEW VW_HEALTHCARE_ANALYTICS AS
SELECT
    p.patientId,
    p.name AS patient_name,
    p.age,
    p.gender,

    a.appointmentId,
    a.appointmentDate,
    a.status AS appointment_status,

    d.doctorId,
    d.name AS doctor_name,
    d.specialization,
    c.clinicId,
    c.name AS clinic_name,
    c.location AS clinic_location,

    pf.allergies,
    pf.chronicConditions,
    pf.notes AS patient_file_notes,

    em.occupation,
    em.marital_status,
    em.blood_type,
    em.smoking_status,
    em.physical_activity,
    em.insurance_provider,
    em.transportation

FROM ds_oracle_patients p

LEFT JOIN ds_oracle_appointments a
    ON p.patientId = a.patientId

LEFT JOIN ds_pg_doctors d
    ON a.doctorId = d.doctorId

LEFT JOIN ds_pg_clinics c
    ON d.clinicId = c.clinicId

LEFT JOIN ds_mongo_patient_files pf
    ON p.patientId = pf.patientId

LEFT JOIN ds_json_extra_medical_table em
    ON p.patientId = em.patient_id;

SELECT * FROM VW_HEALTHCARE_ANALYTICS;