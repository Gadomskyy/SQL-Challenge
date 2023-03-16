CREATE TABLE customer_orders_cleaned AS
(  
SELECT  
order_id, 
customer_id, 
pizza_id, 
CASE 
WHEN (exclusions = '' OR exclusions = 'null') THEN NULL 
ELSE exclusions END AS exclusions, 
CASE 
WHEN (extras = '' OR extras = 'null') THEN NULL 
ELSE extras END AS extras, 
order_time 
FROM customer_orders)