
with cte as (
select 
s.seller_id
,sum( s.price) as total_sales_price
, dense_rank() over(order by sum(s.price) desc ) as rk
from Sales as s 
group by s.seller_id
)

select seller_id from cte
where rk = 1


