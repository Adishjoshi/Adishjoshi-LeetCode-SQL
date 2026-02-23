WITH RECURSIVE hierarchy AS (
    -- Base case: direct reports to employee 1
    SELECT employee_id
    FROM Employees
    WHERE manager_id = 1 AND employee_id <> 1  -- exclude the boss themselves!

    UNION ALL

    -- Recursive step: find reports of people already found
    SELECT e.employee_id
    FROM Employees e
    JOIN hierarchy h ON e.manager_id = h.employee_id
    WHERE e.employee_id <> e.manager_id  -- prevent self-referencing loops!
)
SELECT employee_id
FROM hierarchy
