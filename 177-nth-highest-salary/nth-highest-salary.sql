CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) 
RETURNS TABLE (Salary INT) 
AS $$
BEGIN
  IF N <= 0 THEN
    RETURN QUERY SELECT NULL::INT;
  ELSE
    RETURN QUERY (
      SELECT DISTINCT e.salary
      FROM Employee e
      ORDER BY e.salary DESC
      OFFSET N - 1
      LIMIT 1
    );
  END IF;
END;
$$ LANGUAGE plpgsql;



