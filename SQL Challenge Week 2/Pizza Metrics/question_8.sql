SELECT COUNT(*) AS exclusions_and_extras
FROM customer_orders c
JOIN runner_orders r
ON c.order_id = r.order_id
WHERE r.cancellation IS NULL
AND exclusions IS NOT NULL
AND extras IS NOT NULL