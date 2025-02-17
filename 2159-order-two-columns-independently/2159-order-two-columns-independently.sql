WITH CTEfirst_col AS
(
SELECT 
    first_col, 
    ROW_NUMBER() OVER(ORDER BY first_col ASC) AS rnk
FROM Data
),
CTEsecond_col AS
(
SELECT 
    second_col, 
    ROW_NUMBER() OVER(ORDER BY second_col DESC) AS rnk
FROM Data
)
SELECT
    first_col,
    second_col
FROM CTEfirst_col F
JOIN CTEsecond_col S
ON F.rnk = S.rnk