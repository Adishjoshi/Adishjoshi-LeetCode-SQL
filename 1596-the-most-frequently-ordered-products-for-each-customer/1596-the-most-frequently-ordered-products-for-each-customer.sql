-- Write your PostgreSQL query statement below
with cte as (select 
o.customer_id
,count(o.order_id) as ct
,max(o.order_date)
,max(p.product_id) as product_id
,max(p.product_name) as product_name
,rank() over(partition by o.customer_id order by count(o.order_id) desc) as rkk

from Orders as o
left join Products as p on o.product_id = p.product_id
group by o.customer_id, o.product_id
order by o.customer_id)

select 
customer_id
,product_id
,product_name
from cte
where rkk = 1