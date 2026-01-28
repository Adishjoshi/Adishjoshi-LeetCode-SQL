
select 
e.employee_id 
from Employees as e
where e.manager_id not in (select employee_id from Employees)
and e.salary < '30000'
order by employee_id asc