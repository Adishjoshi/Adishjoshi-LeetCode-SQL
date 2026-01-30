# Write your MySQL query statement below


with t as (
    select 
        round(sqrt(pow(p1.x - p2.x, 2) + pow(p1.y - p2.y, 2)), 2) as dst
    from point2d as p1
    join point2d as p2 
    having dst != 0
)

select 
    min(dst) as shortest
from t

