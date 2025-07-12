# Write your MySQL query statement below
with cte as (select
e.id
,e.name as emp_name
,e.salary 
,d.name as dep_name
,rank() over(partition by d.name order by salary desc) as rk
from Employee as e 
left join Department as d on e.departmentId = d.id
)

select 
emp_name  as "Department"
,dep_name as "Employee"
,salary
from cte 
where rk = 1