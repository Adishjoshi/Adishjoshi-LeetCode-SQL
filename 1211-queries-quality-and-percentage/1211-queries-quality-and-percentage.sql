


select q.query_name, 
round(avg(q.rating/q.position),2) as quality,
round(sum(if(rating<3,1,0))/count(*)*100,2) as poor_query_percentage
from Queries q
where q.query_name is not null
group by q.query_name