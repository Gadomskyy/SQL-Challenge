SELECT customer_id, ROUND(AVG(distance),2) AS avg_distance
FROM runner_orders r
JOIN customer_orders c
ON  r.order_id = c.order_id
GROUP BY customer_id