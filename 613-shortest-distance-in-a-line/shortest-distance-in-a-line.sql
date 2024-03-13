-- Write your PostgreSQL query statement below
SELECT MIN(NULLIF(abs(p1.x-p2.x),0)) AS shortest FROM point p1,point p2
WHERE p1.x!=p2.x