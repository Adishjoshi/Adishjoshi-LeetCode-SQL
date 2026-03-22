WITH ranked AS (
    SELECT
        id,
        company,
        salary,
        ROW_NUMBER() OVER (PARTITION BY company ORDER BY salary) AS rn,
        COUNT(*) OVER (PARTITION BY company) AS cnt
    FROM Employee
)
SELECT
    id,
    company,
    salary
FROM ranked
WHERE
    rn = (cnt + 1) / 2  -- for odd counts
    OR
    rn = (cnt + 2) / 2;