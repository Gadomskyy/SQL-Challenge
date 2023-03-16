-- What is the total items and amount spent for each member before they became a member?

WITH orders_before_member_CTE AS (
SELECT members.customer_id,
product_id
FROM sales
JOIN members
ON sales.customer_id = members.customer_id
WHERE sales.order_date < members.join_date
)

SELECT customer_id, SUM(price) AS total_spent_before_member, COUNT(*) AS n_of_orders_before_member
FROM  orders_before_member_CTE o
JOIN menu m 
ON o.product_id = m.product_id
GROUP BY customer_id
ORDER BY customer_id
