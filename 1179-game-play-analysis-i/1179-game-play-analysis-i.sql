# Write your MySQL query statement below
with cte as (select 
player_id
,event_date
,row_number() over(partition by player_id order by event_date asc ) as rn 
from Activity )

select player_id, event_date as first_login 
from cte
where rn = 1