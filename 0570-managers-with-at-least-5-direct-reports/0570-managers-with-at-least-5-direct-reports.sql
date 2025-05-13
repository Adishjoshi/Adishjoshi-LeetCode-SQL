
with cte as (
select 
e.name
,e.id
,e.managerId
,m.name as mgr_name
,m.id as mgr_id
from Employee as e 
left join Employee as m on e.managerId = m.id
)

select mgr_name as "name"
from cte
group by mgr_id
having count(id) >= 5