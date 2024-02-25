-- Write your PostgreSQL query statement below

SELECT ROUND((SELECT COUNT(delivery_id)*100.0 FROM Delivery
WHERE order_date=customer_pref_delivery_date)/COUNT(*),2) AS immediate_percentage 
FROM delivery;