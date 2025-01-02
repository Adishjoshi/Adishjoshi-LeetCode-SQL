WITH cte AS (
    SELECT 
        COUNT(DISTINCT e1.id) AS emp_count, 
        e2.name
    FROM 
        Employee e1
    inner JOIN 
        Employee e2 ON e1.managerId = e2.id
    WHERE 
        e1.managerId IS NOT NULL
    GROUP BY 
        e2.id, e2.name -- Group by both manager's ID and name
    HAVING 
        emp_count >= 5
)
SELECT 
    name 
FROM 
    cte;
