-- Write your PostgreSQL query statement below
with cte3 as (
with cte2 as (
with cte as (

    select
    student_id
    ,course_id
    ,grade
    ,rank() over(partition by student_id order by grade desc) as rk
    from Enrollments

)

select 
student_id
,course_id
,grade
from cte
where  rk = 1
order by course_id asc
)

select 
student_id
,course_id
,grade
,row_number() over(partition by student_id order by course_id) as rnn
from cte2
)

select 
student_id
,course_id
,grade
from cte3 where rnn = 1