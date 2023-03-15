-- Which item was purchased just before the customer became a member?

WITH members_orders_CTE AS(
SELECT members.customer_id,
product_id,
ROW_NUMBER() OVER (PARTITION BY customer_id) AS member_order
 from sales
JOIN members
ON sales.customer_id = members.customer_id
WHERE sales.order_date >= members.join_date
GROUP BY 1,2
)

SELECT
customer_id,
product_name
FROM members_orders_CTE
JOIN menu
ON members_orders_CTE.product_id = menu.product_id
WHERE member_order = 1
ORDER BY customer_id
