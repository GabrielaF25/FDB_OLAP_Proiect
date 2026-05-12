CREATE OR REPLACE VIEW DS_MONGO_PATIENT_FILES_JSON AS
SELECT java_method(
  'org.spark.service.rest.QueryRESTDataService',
  'getRESTDataDocument',
  'http://localhost:8083/api/patient-files'
) AS json_data;

SELECT * FROM DS_MONGO_PATIENT_FILES_JSON;
CREATE OR REPLACE VIEW DS_MONGO_PATIENT_FILES AS
SELECT
    pf.id,
    pf.patientId,
    pf.allergies,
    pf.chronicConditions,
    pf.medicationHistory,
    pf.appointmentPreferences,
    pf.notes
FROM (
    SELECT explode(
        from_json(
            json_data,
            'array<struct<
                id:string,
                patientId:int,
                allergies:array<string>,
                chronicConditions:array<string>,
                medicationHistory:array<string>,
                appointmentPreferences:string,
                notes:string
            >>'
        )
    ) AS pf
    FROM DS_MONGO_PATIENT_FILES_JSON
);
SELECT * FROM DS_MONGO_PATIENT_FILES;