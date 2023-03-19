SELECT runner_id, 
AVG(TIMESTAMPDIFF(MINUTE, order_time, pickup_time)) AS avg_time_to_pickup_mins
FROM runner_orders r
JOIN customer_orders c
ON  r.order_id = c.order_id
GROUP BY runner_id