# Write your MySQL query statement below
with cte as (select 
*, row_number() over(partition by customer_id order by customer_id asc) as num
from 
Customer
order by customer_id )

select customer_id from cte 
where num >= 2 