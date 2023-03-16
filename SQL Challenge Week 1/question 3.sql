-- What was the first item from the menu purchased by each customer?

WITH sale_order_CTE AS(
	SELECT 
		customer_id,
		menu.product_name,
		RANK() OVER (PARTITION BY customer_id ORDER BY customer_id, order_date) AS order_rank
	FROM
		sales
	JOIN menu
	ON sales.product_id = menu.product_id
)

SELECT customer_id, product_name FROM sale_order_CTE
WHERE order_rank = 1
GROUP by customer_id, product_name