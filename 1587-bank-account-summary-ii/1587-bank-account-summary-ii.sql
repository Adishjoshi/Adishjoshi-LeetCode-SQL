# Write your MySQL query statement below
select 
u.name
,sum(amount) as balance
from Transactions t
join Users u on t.account = u.account 
group by t.account
having balance > 10000