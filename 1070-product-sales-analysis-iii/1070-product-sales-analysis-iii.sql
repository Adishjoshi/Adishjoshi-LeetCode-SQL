-- Write your PostgreSQL query statement below
with pfs
as(

    select
    rank() over(partition by product_id order by year asc) as rnn
    ,product_id
    ,year as first_year
    ,quantity
    ,price
    from Sales)

    select 
    product_id
    ,first_year
    ,quantity
    ,price
    from pfs
    where rnn = 1