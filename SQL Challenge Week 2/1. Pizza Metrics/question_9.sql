SELECT HOUR(order_time) AS hour_of_order, COUNT(HOUR(order_time)) AS order_count
FROM customer_orders
GROUP BY hour_of_order
ORDER BY hour_of_order