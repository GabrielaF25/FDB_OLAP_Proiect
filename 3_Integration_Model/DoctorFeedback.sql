CREATE OR REPLACE VIEW V_DOCTOR_FEEDBACK AS 
SELECT 
    d."doctor_id" AS doctor_id, 
    d."name" AS doctor_name, 
    d."specialization" AS specialization, 
    c."name" AS clinic_name, 
    f."patient_id" AS patient_id, 
    f."rating" AS rating, 
    f."feedback" AS feedback_text 
FROM "public"."doctors"@pg_link d 
JOIN "public"."clinics"@pg_link c 
    ON d."clinic_id" = c."clinic_id" 
LEFT JOIN feedback@mongo_link f 
    ON d."doctor_id" = f."doctor_id"; 