--Analiză pe clinici

CREATE OR REPLACE VIEW VW_OLAP_CLINIC_PERFORMANCE AS
SELECT
    COALESCE(clinic_name, 'Unknown Clinic') AS clinic_name,
    COALESCE(clinic_location, 'Unknown Location') AS clinic_location,

    COUNT(*) AS total_appointments,

    COUNT(DISTINCT doctorId) AS total_doctors,

    COUNT(DISTINCT patientId) AS total_patients,

    ROUND(AVG(age), 2) AS avg_patient_age,

    ROUND(
        SUM(
            CASE
                WHEN appointment_status = 'Completed' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
    2) AS completion_rate

FROM VW_HEALTHCARE_ANALYTICS

GROUP BY
    COALESCE(clinic_name, 'Unknown Clinic'),
    COALESCE(clinic_location, 'Unknown Location');

SELECT * FROM VW_OLAP_CLINIC_PERFORMANCE;