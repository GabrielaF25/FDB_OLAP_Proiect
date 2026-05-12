
CREATE OR REPLACE VIEW DS_ORACLE_PATIENTS_JSON AS
SELECT java_method(
  'org.spark.service.rest.QueryRESTDataService',
  'getRESTDataDocument',
  'http://localhost:8084/api/patients'
) AS json_data;

CREATE OR REPLACE VIEW DS_ORACLE_PATIENTS AS
SELECT
    patient.patientId,
    patient.name,
    patient.age,
    patient.gender,
    patient.phone
FROM (
    SELECT explode(
        from_json(
            json_data,
            'array<struct<
                patientId:int,
                name:string,
                age:int,
                gender:string,
                phone:string
            >>'
        )
    ) AS patient
    FROM DS_ORACLE_PATIENTS_JSON
);
======================================================
SELECT * FROM DS_ORACLE_PATIENTS;
