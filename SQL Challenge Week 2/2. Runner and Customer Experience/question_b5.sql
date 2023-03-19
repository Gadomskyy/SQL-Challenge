SELECT 
MAX(duration) - MIN(duration) AS delivery_time_max_diff
FROM runner_orders r
