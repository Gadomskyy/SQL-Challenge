-- Which item was the most popular for each customer?

WITH popular_dish_CTE AS(
SELECT DISTINCT
customer_id,
product_id,
count(product_id) OVER(partition by customer_id, product_id) AS popular_dish_count
from sales
)

SELECT customer_id, 
product_name,
popular_dish_count
FROM popular_dish_CTE
JOIN menu
ON popular_dish_CTE.product_id = menu.product_id
WHERE popular_dish_count = (
	SELECT max(popular_dish_count) FROM popular_dish_CTE AS p
    WHERE popular_dish_CTE.customer_id = p.customer_id)
GROUP BY 1,2,3
ORDER BY customer_id

