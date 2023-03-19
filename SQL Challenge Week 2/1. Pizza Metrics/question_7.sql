SELECT customer_id, 
SUM(CASE
WHEN exclusions IS NOT NULL OR extras IS NOT NULL THEN 1
ELSE 0
END) AS changes,
SUM(CASE
WHEN exclusions IS NULL AND extras IS NULL THEN 1
ELSE 0
END
) AS no_changes
FROM customer_orders c
JOIN runner_orders r
ON c.order_id = r.order_id
WHERE r.cancellation IS NULL
GROUP BY customer_id