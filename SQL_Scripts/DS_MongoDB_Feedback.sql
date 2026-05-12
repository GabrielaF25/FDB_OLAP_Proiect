CREATE OR REPLACE VIEW DS_MONGO_FEEDBACK_JSON AS
SELECT java_method(
  'org.spark.service.rest.QueryRESTDataService',
  'getRESTDataDocument',
  'http://localhost:8083/api/feedback'
) AS json_data;

SELECT * FROM DS_MONGO_FEEDBACK_JSON;

CREATE OR REPLACE VIEW DS_MONGO_FEEDBACK AS
SELECT
    feedback_item.id,
    feedback_item.patientId,
    feedback_item.doctorId,
    feedback_item.clinicId,
    feedback_item.feedback,
    feedback_item.rating,
    feedback_item.date
FROM (
    SELECT explode(
        from_json(
            json_data,
            'array<struct<
                id:string,
                patientId:int,
                doctorId:int,
                clinicId:int,
                feedback:string,
                rating:int,
                date:string
            >>'
        )
    ) AS feedback_item
    FROM DS_MONGO_FEEDBACK_JSON
);

SELECT * FROM DS_MONGO_FEEDBACK;