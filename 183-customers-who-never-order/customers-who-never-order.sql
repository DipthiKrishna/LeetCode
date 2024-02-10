-- Customers who never order
SELECT Customers.name AS customers
FROM Customers
LEFT JOIN Orders ON Customers.id = Orders.customerId
WHERE Orders.id IS NULL;