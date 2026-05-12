
--Analiză pe specializări medicale

CREATE OR REPLACE VIEW VW_OLAP_SPECIALIZATION_ANALYSIS AS
SELECT
    COALESCE(specialization, 'Unknown') AS specialization,

    COUNT(*) AS total_appointments,
    COUNT(DISTINCT patientId) AS unique_patients,
    ROUND(AVG(age),2) AS average_patient_age,

    SUM(CASE WHEN appointment_status = 'Completed' THEN 1 ELSE 0 END) AS completed_appointments,
    SUM(CASE WHEN appointment_status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_appointments

FROM VW_HEALTHCARE_ANALYTICS
GROUP BY COALESCE(specialization, 'Unknown');

select * FROM VW_OLAP_SPECIALIZATION_ANALYSIS;