with cte as (
select id, sum(amount) as trans_amount from
(select paid_by as id, -amount as amount from transactions
union all
select paid_to as id, amount from transactions)a
group by id
)

select user_id,
user_name,
credit + ifnull(trans_amount,0) as credit,
case when (credit+ifnull(trans_amount,0)) > 0 then 'No' else 'Yes' end as credit_limit_breached
from Users u
left join cte
on u.user_id = cte.id