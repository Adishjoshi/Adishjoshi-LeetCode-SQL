
select s.user_id, 
round(sum(case when action = 'confirmed' then 1 else 0 end)/count(*),2) as confirmation_rate

from Signups as s
left join Confirmations as c ON s.user_id = c.user_id
group by s.user_id