CREATE OR REPLACE VIEW D_TIME_APPOINTMENT AS 
SELECT DISTINCT 
    appointment_date, 
    EXTRACT(YEAR FROM appointment_date) AS year_no, 
    EXTRACT(MONTH FROM appointment_date) AS month_no, 
    TO_CHAR(appointment_date, 'YYYY-MM') AS year_month 
FROM appointments; 