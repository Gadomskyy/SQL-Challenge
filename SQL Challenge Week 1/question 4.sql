-- What is the most purchased item on the menu and how many times was it purchased by all customers?

SELECT 
    COUNT(sales.product_id) AS times_sold,
    product_name
FROM
    sales
        JOIN
    menu ON sales.product_id = menu.product_id
GROUP BY sales.product_id , product_name
ORDER BY times_sold DESC
LIMIT 1