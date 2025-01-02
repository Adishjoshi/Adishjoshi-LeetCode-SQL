
with cte as
(
SELECT 
    id
    , num
    , LEAD(num, 1) OVER (ORDER BY id ASC) AS lead_num1
    , LEAD(num, 2) OVER (ORDER BY id ASC) AS lead_num2
    , IF(num = LEAD(num, 1) OVER (ORDER BY id ASC) AND num = LEAD(num, 2) OVER (ORDER BY id ASC), 'Y','N') AS result
FROM Logs
)

select num as ConsecutiveNums
from cte 
where result = 'Y'