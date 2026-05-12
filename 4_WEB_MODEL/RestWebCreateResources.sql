BEGIN 
    ORDS.ENABLE_OBJECT( 
        p_enabled        => TRUE, 
        p_schema         => 'HEALTH_USER', 
        p_object         => 'MV_DOCTOR_RANKING', 
        p_object_type    => 'TABLE', 
        p_object_alias   => 'doctor-ranking-new', 
        p_auto_rest_auth => FALSE 
    ); 
    COMMIT; 
END; 

/ 
-- URL: http://localhost:8081/ords/health/doctor-ranking-new

BEGIN 
    ORDS.ENABLE_OBJECT( 
        p_enabled        => TRUE, 
        p_schema         => 'HEALTH_USER', 
        p_object         => 'V_PATIENT_TIMELINE', 
        p_object_type    => 'VIEW', 
        p_object_alias   => 'patient-timeline', 
        p_auto_rest_auth => FALSE 
    ); 
    COMMIT; 
END; 
/ 
-- URL: http://localhost:8081/ords/health/patient-timeline/


BEGIN 
    ORDS.ENABLE_OBJECT( 
        p_enabled        => TRUE, 
        p_schema         => 'HEALTH_USER', 
        p_object         => 'MV_LIFESTYLE_ANALYSIS', 
        p_object_type    => 'TABLE', 
        p_object_alias   => 'lifestyle-analysis', 
        p_auto_rest_auth => FALSE 
    ); 
    COMMIT; 
END; 
/ 

-- URL:  http://localhost:8081/ords/health/lifestyle-analysis/