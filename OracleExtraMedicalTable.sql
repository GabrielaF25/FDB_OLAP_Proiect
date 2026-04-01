CREATE TABLE MEDICAL_EXTRA_RAW (DOC_JSON CLOB)
ORGANIZATION EXTERNAL
(
  TYPE oracle_loader
  DEFAULT DIRECTORY EXT_FILE_DS
  ACCESS PARAMETERS
  (
    records delimited by newline
    nobadfile nodiscardfile nologfile
    fields missing field values are null
    reject rows with all null fields
    ( json_filename char(80) )
    column transforms (DOC_JSON FROM lobfile (json_filename) FROM (dir) CLOB)
  )
  LOCATION ('jsonfiles.txt')
) REJECT LIMIT UNLIMITED;