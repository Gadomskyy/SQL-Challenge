SELECT MAX(biggest_order)
FROM(SELECT COUNT(order_id) AS biggest_order
FROM customer_orders
GROUP BY order_id) AS big_order
