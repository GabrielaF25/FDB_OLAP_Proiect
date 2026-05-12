SELECT java_method(
    'org.spark.service.rest.QueryRESTDataService',
    'getRESTDataDocument',
    'http://localhost:8095/DSA-DOC-JSONService/rest/locations/ExtraMedicalDataView'
);
CREATE VIEW DS_JSON_EXTRA_MEDICAL AS
SELECT java_method(
    'org.spark.service.rest.QueryRESTDataService',
    'getRESTDataDocument',
    'http://localhost:8095/DSA-DOC-JSONService/rest/locations/ExtraMedicalDataView'
) AS json_data;

SELECT * FROM DS_JSON_EXTRA_MEDICAL;

CREATE OR REPLACE VIEW DS_JSON_EXTRA_MEDICAL_TABLE AS
SELECT
    em.patient_id,
    em.occupation,
    em.marital_status,
    em.blood_type,
    em.smoking_status,
    em.alcohol_consumption,
    em.physical_activity,
    em.emergency_contact.name AS emergency_contact_name,
    em.emergency_contact.relationship AS emergency_contact_relationship,
    em.emergency_contact.phone AS emergency_contact_phone,
    em.insurance.provider AS insurance_provider,
    em.insurance.policy_number AS insurance_policy_number,
    em.preferred_language,
    em.transportation
FROM (
    SELECT explode(
        from_json(
            json_data,
            'array<struct<
                patient_id:int,
                occupation:string,
                marital_status:string,
                blood_type:string,
                smoking_status:string,
                alcohol_consumption:string,
                physical_activity:string,
                emergency_contact:struct<
                    name:string,
                    relationship:string,
                    phone:string
                >,
                insurance:struct<
                    provider:string,
                    policy_number:string
                >,
                preferred_language:string,
                transportation:string
            >>'
        )
    ) AS em
    FROM DS_JSON_EXTRA_MEDICAL
);

SELECT * FROM DS_JSON_EXTRA_MEDICAL_TABLE;