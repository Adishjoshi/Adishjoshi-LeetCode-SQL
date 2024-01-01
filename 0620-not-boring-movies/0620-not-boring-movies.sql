# Write your MySQL query statement below

select * FROM Cinema
WHERE mod(id,2) <> 0
AND description not like '%boring%'
order by rating desc