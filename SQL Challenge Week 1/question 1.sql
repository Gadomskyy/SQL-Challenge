-- What is the total amount each customer spent at the restaurant?

SELECT 
    customer_id, SUM(price) AS total_spent
FROM sales
JOIN menu 
	ON sales.product_id = menu.product_id
GROUP BY customer_id