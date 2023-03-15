-- If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
-- Here I interpreted it that you can accumulate points while not being a member

SELECT 
customer_id,
SUM(CASE
	WHEN m.product_id = 1 THEN m.price * 20
    ELSE m.price * 10 END) AS total_points
FROM sales s,
	menu m
WHERE m.product_id = s.product_id
GROUP BY customer_id