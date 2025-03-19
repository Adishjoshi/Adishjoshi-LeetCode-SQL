WITH monthly_spending AS (
    SELECT 
        o.customer_id, 
        c.name,
        DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,
        SUM(p.price * o.quantity) AS total_spent
    FROM Orders o
    JOIN Product p ON o.product_id = p.product_id
    JOIN Customers c ON o.customer_id = c.customer_id
    WHERE o.order_date BETWEEN '2020-06-01' AND '2020-07-31'
    GROUP BY o.customer_id, c.name, order_month
)

SELECT DISTINCT m1.customer_id, m1.name
FROM monthly_spending m1
JOIN monthly_spending m2 
    ON m1.customer_id = m2.customer_id
WHERE m1.order_month = '2020-06' 
    AND m1.total_spent >= 100
    AND m2.order_month = '2020-07' 
    AND m2.total_spent >= 100;
