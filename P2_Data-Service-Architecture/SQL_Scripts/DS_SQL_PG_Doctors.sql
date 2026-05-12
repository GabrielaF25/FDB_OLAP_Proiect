CREATE OR REPLACE VIEW DS_PG_DOCTORS_JSON AS
SELECT java_method(
  'org.spark.service.rest.QueryRESTDataService',
  'getRESTDataDocument',
  'http://localhost:8082/api/doctors'
) AS json_data;

SELECT * FROM DS_PG_DOCTORS_JSON;


CREATE OR REPLACE VIEW DS_PG_DOCTORS AS
SELECT
    doctor.doctorId,
    doctor.name,
    doctor.specialization,
    doctor.clinicId
FROM (
    SELECT explode(
        from_json(
            json_data,
            'array<struct<
                doctorId:int,
                name:string,
                specialization:string,
                clinicId:int
            >>'
        )
    ) AS doctor
    FROM DS_PG_DOCTORS_JSON
);


SELECT * FROM DS_PG_DOCTORS;