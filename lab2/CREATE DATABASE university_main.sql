CREATE DATABASE university_main
    WITH
    OWNER = DEFAULT
    TEMPLATE = template0
    ENCODING = 'UTF8';

CREATE DATABASE university_archive
    WITH
    TEMPLATE = template0
    CONNECTION LIMIT = 50;

CREATE DATABASE university_test
    WITH
    IS_TEMPLATE = true
    CONNECTION LIMIT = 10;


CREATE TABLESPACE student_data
    LOCATION '/Users/axaxaxaxxaaxaxaxxa/pg_tablespaces/students';

CREATE TABLESPACE course_data
    OWNER CURRENT_USER
    LOCATION '/Users/axaxaxaxxaaxaxaxxa/pg_tablespaces/courses';


CREATE DATABASE university_distributed
    WITH
    TEMPLATE = template0
    ENCODING = 'LATIN9'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = student_data;



SELECT
    d.datname,
    pg_get_userbyid(d.datdba) AS owner,
    pg_encoding_to_char(d.encoding) AS encoding,
    d.datconnlimit AS connection_limit,
    d.datistemplate AS is_template,
    t.spcname AS tablespace
FROM pg_database AS d
JOIN pg_tablespace AS t
    ON t.oid = d.dattablespace
WHERE d.datname IN (
    'university_main',
    'university_archive',
    'university_test',
    'university_distributed'
)
ORDER BY d.datname;


SELECT
    spcname,
    pg_get_userbyid(spcowner) AS owner,
    pg_tablespace_location(oid) AS location
FROM pg_tablespace
WHERE spcname IN ('student_data', 'course_data')
ORDER BY spcname;