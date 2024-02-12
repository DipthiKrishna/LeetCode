/*a solution to fix the names so that only the first character 
is uppercase and the rest are lowercase*/
SELECT user_id,CONCAT(UPPER(SUBSTRING(name,1,1)),LOWER(SUBSTRING(name,2))) AS name
FROM Users
ORDER by user_id;
