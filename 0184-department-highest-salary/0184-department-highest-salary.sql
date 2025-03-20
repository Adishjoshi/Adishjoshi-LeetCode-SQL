with cte as (select 

e.id as emp_id 
,e.name as emp_name
,e.salary

,d.id as dep_id
,d.name as dep_name
,rank() over(partition by e.departmentId order by e.salary desc) as rk
from Employee e
join Department d on e.departmentId = d.id )

select dep_name as "Department"
,emp_name as "Employee"
,salary as "Salary"
 from cte
 where rk = 1