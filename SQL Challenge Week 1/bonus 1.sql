-- Bonus question 1: Join All The Things - Recreate table

SELECT s.customer_id, order_date, product_name, price,
CASE 
	WHEN  order_date >= (SELECT join_date from members WHERE members.customer_id = s.customer_id) THEN 'Y'
	ELSE 'N' END AS 'Member?'
FROM sales s
JOIN menu m
ON s.product_id = m.product_id  