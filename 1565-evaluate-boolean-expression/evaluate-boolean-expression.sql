-- Write your PostgreSQL query statement below

SELECT e.left_operand,e.operator,e.right_operand,
CASE WHEN e.operator = '>' THEN CASE WHEN v1.value > v2.value THEN 'true' ELSE 'false' END 
     WHEN e.operator = '<' THEN CASE WHEN v1.value < v2.value THEN 'true' ELSE 'false' END
     WHEN e.operator = '=' THEN CASE WHEN v1.value = v2.value THEN 'true' ELSE 'false' END
     END AS value
FROM expressions e
JOIN Variables v1 ON e.left_operand=v1.name 
JOIN VAriables v2 ON e.right_operand=v2.name;