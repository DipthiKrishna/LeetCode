-- Write your PostgreSQL query statement below
SELECT country.name AS country FROM country
LEFT JOIN person ON country.country_code=substring(person.phone_number,1,3)
LEFT JOIN calls ON person.id IN (calls.caller_id,calls.callee_id)
GROUP BY country.name HAVING AVG(calls.duration) > (SELECT AVG(duration) FROM calls);

        