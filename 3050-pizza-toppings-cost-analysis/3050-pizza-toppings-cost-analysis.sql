# Write your MySQL query statement below

select
CONCAT(t1.topping_name,",",t2.topping_name,",",t3.topping_name) as pizza
,round(t1.cost+t2.cost+t3.cost,2) as total_cost
from Toppings as t1
join Toppings as t2 on t1.topping_name < t2.topping_name
join Toppings as t3 on t2.topping_name < t3.topping_name
order by total_cost desc, pizza asc