



with first_order_immediate_scheduled as(
select t.*,
rank() over (partition by t.customer_id order by t.order_date) as first_order,
case when order_date = customer_pref_delivery_date then 1 else 0 end as immediate
from Delivery as t)



select round(avg(immediate),4) * 100 as immediate_percentage
from first_order_immediate_scheduled t
where first_order = 1