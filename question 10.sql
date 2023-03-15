-- In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - 
-- how many points do customer A and B have at the end of January?

WITH double_points_date_CTE AS(
SELECT 
customer_id,
join_date,
DATE_ADD(join_date, INTERVAL 6 DAY) AS val_dbl_pts_dt
FROM members
)

SELECT d.customer_id,
SUM(CASE
	WHEN m.product_id = 1 THEN m.price * 20
    WHEN s.order_date BETWEEN d.join_date and d.val_dbl_pts_dt THEN m.price * 20
    ELSE m.price * 10 END) AS points
FROM double_points_date_CTE d
JOIN sales AS s
 ON d.customer_id = s.customer_id
JOIN menu AS m
 ON s.product_id = m.product_id
GROUP BY d.customer_id
ORDER BY points DESC