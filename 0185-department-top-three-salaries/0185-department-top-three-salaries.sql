# Write your MySQL query statement below
WITH cte AS (
    SELECT 
        e.id,
        e.name AS Employeename,
        e.salary,
        e.departmentId,
        d.id AS deptId,
        d.name AS Departmentname,
        DENSE_RANK() OVER(PARTITION BY d.id ORDER BY e.salary DESC) AS rnk 
        #Why dense rank? As two people can still have same salary
    FROM 
        Employee e 
    LEFT JOIN 
        Department d ON e.departmentId = d.id 
)
SELECT 
    Departmentname AS Department,
    Employeename AS Employee,
    salary AS Salary
FROM 
    cte 
WHERE 
    rnk <= 3
