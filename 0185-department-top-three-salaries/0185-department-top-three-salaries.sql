with cte as (select 
e.id
,e.name as "Employee"
,e.salary
,d.name as "Department"
,dense_rank() over(partition by d.name order by e.salary desc) as rk
from Employee as e 
left join Department as d ON e.departmentId = d.id
)

select Department, Employee, salary
from cte
where rk <= 3
