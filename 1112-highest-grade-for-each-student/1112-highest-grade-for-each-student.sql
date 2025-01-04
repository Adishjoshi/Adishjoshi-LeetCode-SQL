WITH cte AS (
    SELECT 
        student_id, 
        course_id, 
        grade, 
        RANK() OVER (PARTITION BY student_id ORDER BY grade DESC) AS rnk
    FROM Enrollments
),
cte2 AS (
    SELECT 
        student_id, 
        course_id, 
        grade, 
        RANK() OVER (PARTITION BY student_id ORDER BY course_id ASC) AS rnk2
    FROM cte
    WHERE rnk = 1
)
SELECT student_id, course_id, grade
FROM cte2
where rnk2 = 1
