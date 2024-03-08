-- Write your PostgreSQL query statement below
--WITH code AS (SELECT substring(phone_number,1,3) AS country_code,id,name,phone_number
--FROM person)
SELECT country.name AS country
FROM country
LEFT JOIN person ON country.country_code=substring(person.phone_number,1,3)
LEFT JOIN calls ON person.id IN (calls.caller_id,calls.callee_id)
GROUP BY country.name
HAVING AVG(calls.duration) > (SELECT AVG(duration) FROM calls);

        