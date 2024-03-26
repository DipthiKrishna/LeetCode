SELECT d.dept_name,IFNULL(COUNT(s.student_id),0) AS student_number
FROM department d LEFT JOIN student s ON d.dept_id =s.dept_id
GROUP BY d.dept_name
ORDER BY 2 DESC,1;
