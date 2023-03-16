SELECT pizza_id, COUNT(c.order_id) AS times_delivered 
FROM customer_orders c
JOIN runner_orders r
ON c.order_id = r.order_id
WHERE cancellation IS NULL
GROUP BY pizza_id