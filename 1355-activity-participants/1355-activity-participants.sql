WITH cte AS (
    SELECT activity, COUNT(1) AS cntofactivity 
    FROM Friends f
    GROUP BY activity
)
SELECT c.activity
FROM cte c
WHERE c.cntofactivity > (SELECT MIN(cntofactivity) FROM cte)
  AND c.cntofactivity < (SELECT MAX(cntofactivity) FROM cte);
