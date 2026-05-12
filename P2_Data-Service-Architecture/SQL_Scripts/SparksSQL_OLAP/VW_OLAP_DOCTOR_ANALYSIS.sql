--Top doctori

CREATE OR REPLACE VIEW VW_OLAP_DOCTOR_ANALYSIS AS
SELECT
    COALESCE(doctor_name, 'Unknown Doctor') AS doctor_name,

    COALESCE(specialization, 'Unknown') AS specialization,

    COUNT(*) AS total_appointments,

    COUNT(DISTINCT patientId) AS unique_patients,

    SUM(
        CASE
            WHEN appointment_status = 'Completed' THEN 1
            ELSE 0
        END
    ) AS completed_cases,

    ROUND(AVG(age),2) AS avg_patient_age

FROM VW_HEALTHCARE_ANALYTICS

GROUP BY
    COALESCE(doctor_name, 'Unknown Doctor'),
    COALESCE(specialization, 'Unknown');

select * from VW_OLAP_DOCTOR_ANALYSIS;