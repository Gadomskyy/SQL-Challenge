SELECT DAYNAME(order_time) AS date_of_order, COUNT(*) AS order_count
FROM customer_orders
GROUP BY date_of_order
ORDER BY order_count DESC