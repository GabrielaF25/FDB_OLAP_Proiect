CREATE OR REPLACE VIEW V_INTEGRATED_APPOINTMENTS AS 
SELECT 
    a.appointment_id, 
    a.patient_id, 
    a.doctor_id, 
    a.appointment_date, 
    a.status, 
    d."name" AS doctor_name, 
    d."specialization" AS specialization, 
    c."name" AS clinic_name, 
    c."location" AS clinic_location 
FROM appointments a 
JOIN "public"."doctors"@pg_link d 
    ON a.doctor_id = d."doctor_id" 
JOIN "public"."clinics"@pg_link c 
    ON d."clinic_id" = c."clinic_id"; 