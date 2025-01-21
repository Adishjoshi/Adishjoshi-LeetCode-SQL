# Write your MySQL query statement below
with cte as (select 
e.id
,e.name as Employee_name
,e.salary as Emp_salary

,e1.name as Mamager_name
,e1.salary as Mgr_Salary

from Employee as e 
left join Employee as e1 on e.managerId = e1.id
where e.salary > e1.salary 
and e.managerId is not null )

select Employee_name as "Employee" from cte