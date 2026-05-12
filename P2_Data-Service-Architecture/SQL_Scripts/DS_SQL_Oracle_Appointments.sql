
CREATE OR REPLACE VIEW DS_ORACLE_APPOINTMENTS_JSON AS
SELECT java_method(
  'org.spark.service.rest.QueryRESTDataService',
  'getRESTDataDocument',
  'http://localhost:8084/api/appointments'
) AS json_data;



CREATE OR REPLACE VIEW DS_ORACLE_APPOINTMENTS AS
SELECT
    appointment.appointmentId,
    appointment.patientId,
    appointment.doctorId,
    appointment.appointmentDate,
    appointment.status
FROM (
    SELECT explode(
        from_json(
            json_data,
            'array<struct<
                appointmentId:int,
                patientId:int,
                doctorId:int,
                appointmentDate:string,
                status:string
            >>'
        )
    ) AS appointment
    FROM DS_ORACLE_APPOINTMENTS_JSON
);