CREATE TABLE runner_orders_cleaned AS(
SELECT 
order_id,
runner_id,
CASE
	WHEN pickup_time = 'null' THEN NULL 
	ELSE pickup_time
	END AS pickup_time,
CASE
	WHEN distance = 'null' THEN NULL
	ELSE TRIM('km' FROM distance) END AS distance,
CASE
	WHEN duration = 'null' THEN NULL 
	ELSE SUBSTRING(duration, 1, 2)
	END AS duration,
CASE
	WHEN cancellation = 'null' or cancellation = '' THEN NULL 
	ELSE cancellation
	END AS cancellation
FROM pizza_runner.runner_orders
)