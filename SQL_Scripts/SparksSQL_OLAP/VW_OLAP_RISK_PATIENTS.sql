--Analiză risc medical
CREATE OR REPLACE VIEW VW_OLAP_RISK_PATIENTS AS
SELECT
    COALESCE(smoking_status, 'Unknown') AS smoking_status,

    COALESCE(physical_activity, 'Unknown') AS physical_activity,

    COALESCE(blood_type, 'Unknown') AS blood_type,

    COUNT(*) AS total_records,

    ROUND(AVG(age),2) AS average_age,

    COUNT(DISTINCT patientId) AS unique_patients

FROM VW_HEALTHCARE_ANALYTICS

GROUP BY
    COALESCE(smoking_status, 'Unknown'),
    COALESCE(physical_activity, 'Unknown'),
    COALESCE(blood_type, 'Unknown');