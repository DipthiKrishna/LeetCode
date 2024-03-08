-- Write your PostgreSQL query statement below
WITH code AS (SELECT substring(phone_number,1,3) AS country_code,id,name,phone_number
FROM person)
SELECT country.name AS country
FROM country
LEFT JOIN code ON country.country_code=code.country_code
LEFT JOIN calls ON code.id IN (calls.caller_id,calls.callee_id)
GROUP BY country.name
HAVING AVG(calls.duration) > (SELECT AVG(duration) FROM calls);

        