# Write your MySQL query statement below
select A.followee AS follower,A.followed_by as num
FROM (select followee, count(*) as followed_by
from Follow
group by followee) A
INNER JOIN 
(select follower, count(*) as follows
from Follow
group by follower) B
on A.followee = B.follower
order by follower