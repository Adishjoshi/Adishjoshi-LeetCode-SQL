# Write your MySQL query statement below
with cte as (select e.employee_id, e3.manager_id
 from Employees as e 
left join Employees as e2 on e.manager_id = e2.employee_id
left join Employees as e3 on e2.manager_id = e3.employee_id)

select employee_id
from cte
where manager_id = 1 and employee_id <> 1