# Write your MySQL query statement below
with cte as (select * , sum(weight) over (order by turn rows between unbounded preceding and current row) as total 
from Queue)

,
cte2 as (select *, rank() over(order by total desc) as rnk
from cte
where total <= 1000)

select person_name 
from cte2 
where rnk =1