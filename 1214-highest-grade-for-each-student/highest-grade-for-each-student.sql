-- Write your PostgreSQL query statement below
WITH rank AS(SELECT student_id,
                    course_id,
                    ROW_NUMBER() OVER(PARTITION BY student_id ORDER BY grade DESC,course_id ASC) AS rownum,
                    grade
            FROM Enrollments)
SELECT student_id,course_id,grade
FROM rank
WHERE rownum = 1
ORDER BY student_id;
            