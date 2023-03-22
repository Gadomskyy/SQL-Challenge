SELECT p.topping_name, COUNT(p.topping_name) AS times_excluded FROM extras e
JOIN pizza_toppings p
ON e.extras = p.topping_id
GROUP BY p.topping_name
ORDER BY 2 DESC