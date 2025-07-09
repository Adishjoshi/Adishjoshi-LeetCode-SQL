# Write your MySQL query statement below
with cte as (select 
t.client_id 
,t.driver_id
,t.city_id
,t.status
,t.request_at
,u.users_id
,u.banned
,u.role
from Trips as t 
left join Users as u on t.client_id = u.users_id
left join Users as u1 on t.driver_id = u1.users_id 
where u.banned = 'No' AND u1.banned = 'No' AND t.request_at between '2013-10-01' and '2013-10-03'
)

select 
request_at as "Day"
,ROUND(SUM(CASE when status like '%cancelled%' then 1 else 0 end)/ count(users_id),2) as "Cancellation Rate"
from cte 
group by request_at


