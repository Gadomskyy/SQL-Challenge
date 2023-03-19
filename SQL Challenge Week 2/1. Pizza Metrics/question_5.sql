SELECT 
    c.customer_id, p.pizza_name, COUNT(c.pizza_id) AS times_delivered
FROM
    customer_orders c
JOIN pizza_names p
ON c.pizza_id = p.pizza_id
GROUP BY customer_id , p.pizza_name
ORDER BY customer_id 