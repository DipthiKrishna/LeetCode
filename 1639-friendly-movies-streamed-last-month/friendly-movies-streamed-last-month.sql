-- Write your PostgreSQL query statement below
SELECT DISTINCT content.title
FROM tvprogram
LEFT JOIN content ON tvprogram.content_id = content.content_id
WHERE TO_CHAR(program_date,'YYYY-MM')='2020-06' AND content.kids_content = 'Y'
AND content.content_type = 'Movies';

