CREATE TABLE pizza_recipes_cleaned AS
(select
  pizza_id,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(toppings, ',', numbers.n), ',', -1)) AS toppings
from
  (select 1 n union all
   select 2 union all select 3 union all
   select 4 union all select 5 union all
   select 6 union all select 7 union all
   select 8) numbers INNER JOIN pizza_recipes
  on CHAR_LENGTH(toppings)
     -CHAR_LENGTH(REPLACE(toppings, ',', ''))>=numbers.n-1
order by
  pizza_id, n
);

DROP TABLE pizza_recipes;

ALTER TABLE pizza_recipes_cleaned RENAME pizza_recipes;