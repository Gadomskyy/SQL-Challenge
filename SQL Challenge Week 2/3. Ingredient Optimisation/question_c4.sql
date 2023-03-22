WITH exclusions_cte AS(
SELECT pizza_order_id, CONCAT('Exclude',' ', t.topping_name) AS addons FROM exclusions e
JOIN pizza_toppings t
ON t.topping_id = e.exclusions
),
extras_cte AS(
SELECT pizza_order_id, CONCAT('Extra',' ', t.topping_name) AS addons FROM extras e
JOIN pizza_toppings t
ON t.topping_id = e.extras
),

exclusions_extras_cte AS
(
SELECT * FROM exclusions_cte
UNION
SELECT * FROM extras_cte
)


SELECT c.pizza_order_id, CONCAT_WS(" - " , pizza_name, group_concat(DISTINCT addons)) AS order_type
FROM customer_orders c
LEFT JOIN exclusions_extras_cte e
ON c.pizza_order_id = e.pizza_order_id
JOIN pizza_names p
ON p.pizza_id = c.pizza_id
GROUP BY 1, pizza_name
