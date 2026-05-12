CREATE OR REPLACE VIEW V_PATIENT_TIMELINE AS 
SELECT 
    a.patient_id, 
    p.name AS patient_name, 
    a.appointment_date, 
    d."name" AS doctor_name, 
    d."specialization" AS specialization, 
    COUNT(*) OVER ( 
        PARTITION BY a.patient_id 
        ORDER BY a.appointment_date 
        ROWS UNBOUNDED PRECEDING 
    ) AS running_total_appointments,
    LAG(a.appointment_date) OVER ( 
        PARTITION BY a.patient_id 
        ORDER BY a.appointment_date 
    ) AS previous_appointment_date, 
    LEAD(a.appointment_date) OVER ( 
        PARTITION BY a.patient_id 
        ORDER BY a.appointment_date 
    ) AS next_appointment_date, 
    FIRST_VALUE(d."name") OVER ( 
        PARTITION BY a.patient_id 
        ORDER BY a.appointment_date 
    ) AS first_doctor_seen, 
    LAST_VALUE(d."name") OVER ( 
        PARTITION BY a.patient_id 
        ORDER BY a.appointment_date 
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING 
    ) AS last_doctor_seen 

FROM appointments a 
JOIN patients p 
    ON a.patient_id = p.patient_id 
JOIN "public"."doctors"@pg_link d 
    ON a.doctor_id = d."doctor_id"; 