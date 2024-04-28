# Write your MySQL query statement below

with cte as (

select *, rank() over(partition by product_id order by change_date desc) as r
from Products
where change_date <= '2019-08-16') 

select product_id, new_price as price
from cte 
where r = 1 
union 
select product_id, 10 as price
From Products
WHERE product_id not in (select product_id from cte)
