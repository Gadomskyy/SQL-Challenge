SELECT runner_id, COUNT(order_id) AS successfull_order
FROM pizza_runner.runner_orders
WHERE cancellation IS NULL
GROUP BY runner_id