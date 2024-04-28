
#with cte as (
#select e.id, e.name as Employeename, e.salary, e.departmentId, d.id, d.name as Departmentname, rank() over(partition by d.id order by e.salary desc) as rnk
#from Employee e 
#left join Department d on e.departmentId = d.id 
#)
#
#
#select Departmentname as Department, Employeename as Employee, e.Salary as Salary
#from cte 
#where rnk = 1
#;

WITH cte AS (
    SELECT 
        e.id,
        e.name AS Employeename,
        e.salary,
        e.departmentId,
        d.id AS deptId,
        d.name AS Departmentname,
        RANK() OVER(PARTITION BY d.id ORDER BY e.salary DESC) AS rnk
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
    rnk = 1;