SELECT
    p.product_name
    ,SUM(o.unit) AS unit
FROM Orders AS o 
inner join Products as p on o.product_id = p.product_id
WHERE o.order_date >= '2020-02-01' 
  AND o.order_date <= '2020-02-29'
GROUP BY 1
HAVING SUM(o.unit) >= 100