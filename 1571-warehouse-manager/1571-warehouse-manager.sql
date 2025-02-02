# Write your MySQL query statement below
with cte as (
select 
 w.name
,w.product_id
,w.units 

,p.product_name
,p.Width
,p.Length
,p.Height

,sum(((p.Width*p.Length*p.Height) * w.units )) as vol

from Warehouse as w 
left join products as p on w.product_id = p.product_id
group by w.name
)

select name as warehouse_name, vol as volume
from cte