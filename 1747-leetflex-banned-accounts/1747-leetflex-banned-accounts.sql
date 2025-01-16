# Write your MySQL query statement below
with cte as (select *, lead(login,1) over(partition by account_id order by account_id) as nextlogin

from LogInfo),

cte2 as (
select *, case
when nextlogin <= logout then 1 else 0 end as flag
from cte )

select distinct (account_id) from cte2
where flag = 1
group by account_id