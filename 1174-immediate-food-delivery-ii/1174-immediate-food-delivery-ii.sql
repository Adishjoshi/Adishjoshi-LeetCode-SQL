# Write your MySQL query statement below
#1 element 1 find 1st order 
#2 find if 1st order = immediate
#3 find percentgae

with firstorder as (
select 
delivery_id 
,customer_id
,order_date
,customer_pref_delivery_date
,rank() over(partition by customer_id order by order_date asc) as rnk
,
CASE 
    WHEN customer_pref_delivery_date = order_date THEN 'immediate'
    ELSE 'scheduled'
    END AS ordertype 
from 
Delivery
)

select  
ROUND(COUNT(CASE WHEN ordertype = 'immediate' THEN 1 END) * 100 / COUNT(ordertype),2) AS immediate_percentage
from firstorder where rnk = 1

    

