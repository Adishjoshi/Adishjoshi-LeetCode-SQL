with cte as
(
Select
student_id,
course_id,
grade,
dense_rank() over (partition by student_id order by  grade desc, course_id asc) as rn
From Enrollments
)
Select 
student_id,
course_id,
grade
from cte
where rn=1
