CREATE OR REPLACE VIEW V_PATIENT_MEDICAL_PROFILE AS
SELECT
    p.patient_id,
    p.name,
    p.age,
    p.gender,
    p.phone,
    j.occupation,
    j.marital_status,
    j.smoking_status,
    j.physical_activity,
    j.transportation,
    j.emergency_name,
    j.emergency_relationship,
    j.emergency_phone,
    j.insurance_provider,
    j.policy_number
FROM patients p
JOIN (
    SELECT
        jt.patient_id,
        jt.occupation,
        jt.marital_status,
        jt.smoking_status,
        jt.physical_activity,
        jt.transportation,
        jt.emergency_name,
        jt.emergency_relationship,
        jt.emergency_phone,
        jt.insurance_provider,
        jt.policy_number
    FROM medical_extra_raw m,
         JSON_TABLE(
            m.doc_json,
            '$[*]'
            COLUMNS (
                patient_id             NUMBER         PATH '$.patient_id',
                occupation             VARCHAR2(50)   PATH '$.occupation',
                marital_status         VARCHAR2(30)   PATH '$.marital_status',
                smoking_status         VARCHAR2(30)   PATH '$.smoking_status',
                physical_activity      VARCHAR2(30)   PATH '$.physical_activity',
                transportation         VARCHAR2(50)   PATH '$.transportation',
                emergency_name         VARCHAR2(100)  PATH '$.emergency_contact.name',
                emergency_relationship VARCHAR2(50)   PATH '$.emergency_contact.relationship',
                emergency_phone        VARCHAR2(20)   PATH '$.emergency_contact.phone',
                insurance_provider     VARCHAR2(100)  PATH '$.insurance.provider',
                policy_number          VARCHAR2(50)   PATH '$.insurance.policy_number'
            )
         ) jt
) j
ON p.patient_id = j.patient_id;