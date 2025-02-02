with latest_login as (select
user_id
,time_stamp
,rank() over(partition by user_id order by time_stamp desc) as rk
from Logins 
where year(time_stamp) = '2020'
)

select user_id, time_stamp as last_stamp from latest_login where rk =1 