-- Write your PostgreSQL query statement below
SELECT DISTINCT content.title
FROM tvprogram
LEFT JOIN content ON tvprogram.content_id = content.content_id
WHERE EXTRACT(year from tvprogram.program_date) = 2020
AND EXTRACT(month from program_date) = 6
AND content.kids_content = 'Y'
AND content.content_type = 'Movies';

