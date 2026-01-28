# Write your MySQL query statement below
with cte as (
    select 
     rank()over(partition by player_id order by event_date asc) as rn
    ,player_id
    ,device_id
from Activity
)

select 
player_id,
device_id
from cte 
where rn =1 