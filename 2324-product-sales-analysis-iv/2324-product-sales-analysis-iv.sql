-- Write your PostgreSQL query statement below
with cte as 
(select 
s.user_id
,s.product_id
,rank() over(partition by s.user_id order by sum(s.quantity*p.price) desc) as rkk
from Sales as s
inner join Product as p ON s.product_id = p.product_id
group by s.user_id,s.product_id
)

select 
user_id, product_id
from cte 
where rkk = 1