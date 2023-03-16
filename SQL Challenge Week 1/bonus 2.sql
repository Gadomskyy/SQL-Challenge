-- Bonus question 2: Rank All The Things - Recreate table


WITH is_member_CTE AS(SELECT s.customer_id, order_date, product_name, price,
CASE
WHEN  order_date >= (SELECT join_date from members WHERE members.customer_id = s.customer_id) THEN 'Y'
	ELSE 'N' END AS is_member
FROM sales s
JOIN menu m
ON s.product_id = m.product_id
)

SELECT *,
ROW_NUMBER() OVER(PARTITION BY customer_id) AS ranking
 FROM (SELECT * from is_member_cte WHERE is_member = 'Y') AS i
UNION ALL
SELECT *,
NULL AS ranking
FROM (SELECT * from is_member_cte WHERE is_member = 'N') as ni
ORDER BY customer_id, order_date