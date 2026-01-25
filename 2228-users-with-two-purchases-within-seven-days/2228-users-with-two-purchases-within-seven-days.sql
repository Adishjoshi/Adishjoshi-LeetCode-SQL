/* Write your T-SQL query statement below */

Select
distinct a.user_id
from purchases a
    join purchases b
    on a.user_id = b.user_id
    and a.purchase_id <> b.purchase_id
    and abs(datediff(day,a.purchase_date, b.purchase_date))<=7
    order by a.user_id