CREATE TABLE APPOINTMENTS ( 
    appointment_id NUMBER PRIMARY KEY, 
    patient_id NUMBER, 
    doctor_id NUMBER, 
    appointment_date DATE, 
    status VARCHAR2(20), 
    CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES PATIENTS(patient_id) 

); 