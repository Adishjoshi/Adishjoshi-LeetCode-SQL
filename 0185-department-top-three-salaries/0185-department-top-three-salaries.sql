WITH CTE AS (
    SELECT DISTINCT 
        d.name AS Department, 
        e.name AS Employee, 
        e.Salary, 
        DENSE_RANK() OVER (PARTITION BY d.name ORDER BY e.Salary DESC) AS rnk
    FROM 
        Employee e 
    LEFT JOIN 
        Department d ON e.departmentId = d.id
)

SELECT Department, Employee, Salary
FROM  
    CTE 
WHERE 
    rnk <= 3;
