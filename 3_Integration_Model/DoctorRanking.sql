CREATE OR REPLACE VIEW V_DOCTOR_RANKING AS 
SELECT 
    clinic_name, 
    doctor_name, 
    specialization, 
    total_appointments, 
    avg_rating, 
    total_reviews, 
    RANK() OVER (ORDER BY total_appointments DESC, avg_rating DESC) AS rnk, 
    DENSE_RANK() OVER (ORDER BY total_appointments DESC, avg_rating DESC) AS dense_rnk, 
    PERCENT_RANK() OVER (ORDER BY total_appointments, avg_rating) AS pct_rnk 
FROM ( 
    SELECT 
        c."name" AS clinic_name, 
        d."name" AS doctor_name, 
        d."specialization" AS specialization, 
        COUNT(DISTINCT a.appointment_id) AS total_appointments, 
        ROUND(AVG(f."rating"), 2) AS avg_rating, 
        COUNT(DISTINCT f."patient_id") AS total_reviews 
    FROM appointments a 
    JOIN "public"."doctors"@pg_link d 
        ON a.doctor_id = d."doctor_id" 
    JOIN "public"."clinics"@pg_link c 
        ON d."clinic_id" = c."clinic_id" 
    LEFT JOIN feedback@mongo_link f 
        ON a.doctor_id = f."doctor_id" 
    GROUP BY 
        c."name", 
        d."name", 
        d."specialization" 
); 