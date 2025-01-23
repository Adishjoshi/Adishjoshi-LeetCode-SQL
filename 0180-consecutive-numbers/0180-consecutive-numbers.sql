WITH cte AS (
    SELECT 
        id,
        num,
        LEAD(num, 1) OVER (ORDER BY id ASC) AS lead_num1,
        LEAD(num, 2) OVER (ORDER BY id ASC) AS lead_num2
    FROM Logs
)

SELECT distinct num AS ConsecutiveNums
FROM cte
WHERE num = lead_num1 AND num = lead_num2
