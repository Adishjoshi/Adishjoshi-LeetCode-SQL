# Write your MySQL query statement below
with cte as(

    select s.sale_id
    ,s.product_id
    ,s.year as first_year
    ,s.quantity
    ,s.price
    
    ,p.product_name
    ,rank()over(partition by s.product_id order by s.year) as rk
    from Sales as s
    left join Product as p ON s.product_id = p.product_id
)

select product_id, first_year, quantity, price from cte 
where rk = 1