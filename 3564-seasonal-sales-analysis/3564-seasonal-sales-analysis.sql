WITH base AS (
    SELECT
        CASE
            WHEN MONTH(s.sale_date) IN (12, 1, 2) THEN 'Winter'
            WHEN MONTH(s.sale_date) IN (3, 4, 5) THEN 'Spring'
            WHEN MONTH(s.sale_date) IN (6, 7, 8) THEN 'Summer'
            WHEN MONTH(s.sale_date) IN (9, 10, 11) THEN 'Fall'
            ELSE 'Other'
        END AS season
      , p.category
      , SUM(s.quantity) AS total_quantity
      , SUM(s.quantity * s.price) AS total_revenue
    FROM sales s
    LEFT JOIN products p
      ON s.product_id = p.product_id
    GROUP BY
        season
      , p.category
),

cte as (
SELECT
    season
  , category
  , total_quantity
  , total_revenue
  , DENSE_RANK() OVER (
        PARTITION BY season
        ORDER BY total_quantity DESC, total_revenue DESC
    ) AS rkk
FROM base
)

select    season
  , category
  , total_quantity
  , total_revenue from cte 
where rkk =1 