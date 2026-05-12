--Analiză pe asigurări
CREATE OR REPLACE VIEW VW_OLAP_INSURANCE_ANALYSIS AS
SELECT
    COALESCE(insurance_provider, 'Unknown') AS insurance_provider,

    COUNT(*) AS total_appointments,

    COUNT(DISTINCT patientId) AS total_patients,

    ROUND(AVG(age),2) AS avg_age,

    SUM(
        CASE
            WHEN smoking_status = 'Smoker' THEN 1
            ELSE 0
        END
    ) AS smokers_count

FROM VW_HEALTHCARE_ANALYTICS
GROUP BY insurance_provider;

SELECT * FROM VW_OLAP_INSURANCE_ANALYSIS;