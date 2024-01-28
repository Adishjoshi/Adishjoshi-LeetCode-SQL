# Write your MySQL query statement below



select user_id, count(distinct follower_id) as followers_count

FROM Followers 
group by user_id
order by user_id ASC