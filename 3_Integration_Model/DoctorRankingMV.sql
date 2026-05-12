CREATE MATERIALIZED VIEW MV_DOCTOR_RANKING AS 
SELECT 
    clinic_name, 
    doctor_name, 
    specialization, 
    total_appointments, 
    avg_rating, 
    total_reviews, 
    rnk, 
    dense_rnk, 
    pct_rnk 
FROM V_DOCTOR_RANKING; 