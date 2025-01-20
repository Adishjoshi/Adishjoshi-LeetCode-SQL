# Write your MySQL query statement below
with cte as (
select departure_airport as airport_id, flights_count
from Flights
union all
select arrival_airport as airport_id, flights_count
from Flights
),

cte2 as (
select 
airport_id
,sum(flights_count) as flights_counts
,rank() over(order by sum(flights_count) desc) as rk
from cte
group by airport_id
)

select airport_id 
from cte2
where rk = 1