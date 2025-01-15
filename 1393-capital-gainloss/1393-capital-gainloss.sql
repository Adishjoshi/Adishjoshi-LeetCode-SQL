# Write your MySQL query statement below

with cte as (select * 
,case 
when operation = 'Buy' then price * (-1)
when operation = 'Sell' then price * 1
end as amt
from Stocks)

select stock_name, sum(amt) as capital_gain_loss
from cte
group by stock_name