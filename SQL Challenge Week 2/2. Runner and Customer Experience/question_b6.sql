SELECT
order_id, 
runner_id,
distance,
duration,
ROUND(distance/(duration/60), 2) as speed_kmh
FROM runner_orders
WHERE distance IS NOT NULL

-- The avg speed seems to improve over time