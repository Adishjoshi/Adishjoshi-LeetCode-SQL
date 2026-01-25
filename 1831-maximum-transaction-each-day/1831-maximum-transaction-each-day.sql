# Write your MySQL query statement below
with cte as (
select
rank() over(partition by day order by amount desc) as rankk
,transaction_id
,day
,amount
from Transactions
)

select transaction_id 
from cte
where rankk = 1
order by transaction_id asc