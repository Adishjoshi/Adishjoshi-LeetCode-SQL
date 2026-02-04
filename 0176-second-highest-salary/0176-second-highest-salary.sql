-- Write your PostgreSQL query statement below
with cte as (
  select
    salary
  , dense_rank() over (order by salary desc) as rk
  from Employee
)

select
  max(case when rk = 2 then salary else null end) as SecondHighestSalary
from cte