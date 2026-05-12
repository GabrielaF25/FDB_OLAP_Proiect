CREATE OR REPLACE VIEW D_DOCTOR AS 
SELECT 
    d."doctor_id" AS doctor_id, 
    d."name" AS doctor_name, 
    d."specialization" AS specialization, 
    c."clinic_id" AS clinic_id, 
    c."name" AS clinic_name, 
    c."location" AS clinic_location 
FROM "public"."doctors"@pg_link d 
JOIN "public"."clinics"@pg_link c 
    ON d."clinic_id" = c."clinic_id"; 