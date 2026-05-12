CREATE MATERIALIZED VIEW MV_LIFESTYLE_ANALYSIS AS 
SELECT 
    NVL(c."name", 'TOTAL_ALL_CLINICS') AS clinic_name, 
    NVL(jt.smoking_status, 'TOTAL_ALL_SMOKING_STATUS') AS smoking_status, 
    NVL(jt.physical_activity, 'TOTAL_ALL_ACTIVITY') AS physical_activity, 
    COUNT(a.appointment_id) AS total_appointments, 
    COUNT(DISTINCT a.patient_id) AS total_patients, 
    ROUND(AVG(p.age), 2) AS avg_age 
FROM appointments a 
JOIN patients p 
    ON a.patient_id = p.patient_id 
JOIN "public"."doctors"@pg_link d 
    ON a.doctor_id = d."doctor_id" 
JOIN "public"."clinics"@pg_link c 
    ON d."clinic_id" = c."clinic_id" 
JOIN medical_extra_raw m 
    ON 1 = 1 
JOIN JSON_TABLE( 
        m.doc_json, 
        '$[*]' 
        COLUMNS ( 
            patient_id         NUMBER        PATH '$.patient_id', 
            occupation         VARCHAR2(50)  PATH '$.occupation', 
            marital_status     VARCHAR2(30)  PATH '$.marital_status', 
            smoking_status     VARCHAR2(30)  PATH '$.smoking_status', 
            physical_activity  VARCHAR2(30)  PATH '$.physical_activity', 
            transportation     VARCHAR2(50)  PATH '$.transportation' 
        ) 
     ) jt 
    ON a.patient_id = jt.patient_id 
GROUP BY ROLLUP(c."name", jt.smoking_status, jt.physical_activity); 