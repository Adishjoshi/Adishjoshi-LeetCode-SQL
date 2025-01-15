SELECT
    product_id,
    product_name,
    report_year,
    total_amount
FROM Product
JOIN (
    SELECT
        product_id,
        '2018' AS report_year,
        average_daily_sales*(DATEDIFF(LEAST(period_end,'2018-12-31'),GREATEST(period_start,'2018-01-01'))+1) AS total_amount
    FROM Sales
    WHERE 2018 BETWEEN YEAR(period_start) AND YEAR(period_end)
    UNION
    SELECT
        product_id,
        '2019' AS report_year,
        average_daily_sales*(DATEDIFF(LEAST(period_end,'2019-12-31'),GREATEST(period_start,'2019-01-01'))+1) AS total_amount
    FROM Sales
    WHERE 2019 BETWEEN YEAR(period_start) AND YEAR(period_end)
    UNION
    SELECT
        product_id,
        '2020' AS report_year,
        average_daily_sales*(DATEDIFF(LEAST(period_end,'2020-12-31'),GREATEST(period_start,'2020-01-01'))+1) AS total_amount
    FROM Sales
    WHERE 2020 BETWEEN YEAR(period_start) AND YEAR(period_end)
) a
USING(product_id)
ORDER BY 1,3