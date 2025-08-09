with cte as (
    select 
          t.customer_id
        , t.transaction_id
        , t.product_id
        , t.transaction_date
        , t.amount
        , p.category
    from Transactions as t
    left join Products as p 
        on t.product_id = p.product_id
)
, category_rank as (
    select
          customer_id
        , category
        , count(*) as category_count
        , max(transaction_date) as latest_date
        , rank() over (
              partition by customer_id
              order by count(*) desc
                   , max(transaction_date) desc
          ) as rnk
    from cte
    group by customer_id, category
)
, agg as (
    select
          customer_id
        , round(sum(amount), 2) as total_amount
        , count(transaction_id) as transaction_count
        , count(distinct category) as unique_categories
        , round(avg(amount), 2) as avg_transaction_amount
        , round((count(transaction_id) * 10) + (sum(amount) / 100), 2) as loyalty_score
    from cte
    group by customer_id
)
select
      a.customer_id
    , a.total_amount
    , a.transaction_count
    , a.unique_categories
    , a.avg_transaction_amount
    , cr.category as top_category
    , a.loyalty_score
from agg as a
join category_rank as cr
    on a.customer_id = cr.customer_id
   and cr.rnk = 1
order by 
      a.loyalty_score desc
    , a.customer_id asc

