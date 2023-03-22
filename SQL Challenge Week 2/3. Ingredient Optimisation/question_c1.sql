SELECT pizza_name, topping_name FROM pizza_recipes r
JOIN pizza_toppings t
ON r.toppings = t.topping_id
JOIN pizza_names n
ON r.pizza_id = n.pizza_id
ORDER BY pizza_name
