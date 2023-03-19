WITH reg_week_CTE AS (
SELECT 
COUNT(runner_id) AS runner_count,
WEEK(registration_date)+1 AS reg_week
FROM pizza_runner.runners
GROUP BY 2
)

SELECT
reg_week,
SUM(runner_count) OVER (order by reg_week) AS runner_sum
FROM reg_week_CTE

 