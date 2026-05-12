CREATE TABLE doctors
( 
doctor_id SERIAL PRIMARY KEY,
name VARCHAR(100),
specialization VARCHAR(100),
clinic_id INTEGER REFERENCES clinics(clinic_id)
); 

