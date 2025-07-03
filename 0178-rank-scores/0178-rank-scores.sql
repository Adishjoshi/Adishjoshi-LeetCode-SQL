with cte as (select id, score, dense_rank() over ( order by score desc) as rk
from Scores)

select score, rk as "rank"
from cte 