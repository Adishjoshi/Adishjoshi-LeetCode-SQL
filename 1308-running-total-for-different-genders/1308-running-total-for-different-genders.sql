# Write your MySQL query statement below
with cte as (select gender, day, sum(score_points) over(order by day) as total
from Scores
where gender = 'M'

union 

select gender, day, sum(score_points) over(order by day) as total
from Scores
where gender = 'F')

select * from cte
order by gender, day
