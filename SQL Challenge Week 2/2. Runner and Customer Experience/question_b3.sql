WITH prep_time_cte AS(
SELECT c.order_id,
COUNT(c.order_id) AS number_of_pizzas,
TIMESTAMPDIFF(MINUTE, order_time, pickup_time) AS avg_time_to_pickup_mins
FROM runner_orders r
JOIN customer_orders c
ON  r.order_id = c.order_id
GROUP BY 1,3
)

SELECT 
number_of_pizzas,
AVG(avg_time_to_pickup_mins)
FROM prep_time_cte
GROUP BY number_of_pizzas
