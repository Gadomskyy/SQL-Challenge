WITH taken_cancelled_orders_cte AS(
SELECT runner_id,
COUNT(runner_id) AS taken_orders,
SUM(CASE
	WHEN cancellation IS NOT NULL THEN 0
    ELSE 1 END
	) AS successfull_orders
FROM runner_orders
GROUP BY runner_id
)

SELECT runner_id,
taken_orders,
successfull_orders,
ROUND((successfull_orders/taken_orders)*100, 2) AS successfull_delivery_perc
FROM taken_cancelled_orders_cte