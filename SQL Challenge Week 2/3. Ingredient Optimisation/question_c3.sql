SELECT p.topping_name, COUNT(p.topping_name) AS times_excluded FROM exclusions e
JOIN pizza_toppings p
ON e.exclusions = p.topping_id
GROUP BY p.topping_name
ORDER BY 2 DESC