# Write your MySQL query statement below
with trans_rank as (select * 
, rank() over(partition by user_id order by transaction_date asc) as trans_rk
from Transactions),

spend_rank as (

    select 
    *
    , rank() over(partition by user_id order by spend asc) as spend_rk
    from trans_rank 
    where trans_rk <=3
)

select user_id, spend as third_transaction_spend, transaction_date as third_transaction_date
  from spend_rank
where trans_rk = 3 and spend_rk = 3
