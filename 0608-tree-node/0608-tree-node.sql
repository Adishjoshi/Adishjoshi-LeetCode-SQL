# Write your MySQL query statement below
#if the node has noo parent it is root 
#if the node has parent and child then inner 
#if has parent but no child then leaf 


with cte as (select 
t1.id as parent,
t1.p_id as p1,
t2.id as child, 
t2.p_id as p2,
row_number() over(partition by t1.id order by t1.id asc) as num
from Tree as t1
left join Tree as t2 on t1.id = t2.p_id
)

select 
parent as id ,case 
when p1 is null then 'Root'
WHEN child is null then 'Leaf'
ELSE 'Inner' END as type
from cte
where num = 1

