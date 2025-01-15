
with cte as 
    (select u.name as results from users u join movierating m on u.user_id = m.user_id
    group by u.name
    order by count(m.movie_id) desc, u.name asc
    limit 1),
cte2 as
    (select m.title as results from movies m join movierating mr on m.movie_id = mr.movie_id
    where mr.created_at >= "2020-02-01" and mr.created_at <= "2020-02-29"
    group by m.title
    order by avg(mr.rating) desc, m.title asc
    limit 1
    )
select results from cte
union all
select results from cte2