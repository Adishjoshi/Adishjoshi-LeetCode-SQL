
with cte as(
select 
e.id as emp_id
,e.name as "Employee"
,e.salary as "emp_salary"

,m.salary
from Employee as e left join Employee as m on e.managerId = m.id
having e.salary > m.salary
)

select Employee from cte