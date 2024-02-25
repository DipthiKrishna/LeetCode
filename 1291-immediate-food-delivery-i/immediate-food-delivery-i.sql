-- Write your PostgreSQL query statement below

SELECT ROUND((SELECT COUNT(delivery_id) FROM Delivery
WHERE order_date=customer_pref_delivery_date)*100.0/COUNT(*),2) AS immediate_percentage 
FROM delivery;