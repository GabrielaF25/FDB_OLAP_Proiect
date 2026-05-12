CREATE OR REPLACE VIEW DS_PG_CLINICS_JSON AS
SELECT java_method(
  'org.spark.service.rest.QueryRESTDataService',
  'getRESTDataDocument',
  'http://localhost:8082/api/clinics'
) AS json_data;

SELECT * FROM DS_PG_CLINICS_JSON;

CREATE OR REPLACE VIEW DS_PG_CLINICS AS
SELECT
    clinic.clinicId,
    clinic.name,
    clinic.location
FROM (
    SELECT explode(
        from_json(
            json_data,
            'array<struct<
                clinicId:int,
                name:string,
                location:string
            >>'
        )
    ) AS clinic
    FROM DS_PG_CLINICS_JSON
);

SELECT * FROM DS_PG_CLINICS;