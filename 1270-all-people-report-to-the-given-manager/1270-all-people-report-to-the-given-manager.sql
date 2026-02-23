# Write your MySQL query statement below
with cte as(
select 
e.employee_id
,e.employee_name
,m.employee_id as mgr_id
,m.employee_name as mgr_name
,d.employee_id as dir_id 
,d.employee_name as dir_name
,v.employee_id as vp_id 
,v.employee_name as vp_name

from Employees as e 
left join Employees as m on e.manager_id = m.employee_id 
left join Employees as d on m.manager_id = d.employee_id
left join Employees as v on d.manager_id = v.employee_id
)

select 
employee_id 
from cte 
where vp_id = 1
and employee_id <> 1
order by employee_id 