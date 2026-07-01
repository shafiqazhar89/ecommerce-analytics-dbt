with orders as (
    select * from {{ ref('stg_orders') }}
),

order_items as (
    select
        order_id,
        count(*)          as line_count,
        sum(sale_price)   as revenue
    from {{ ref('stg_order_items') }}
    group by order_id
)

select
    o.order_id,
    o.customer_id,
    o.order_status,
    o.ordered_at,
    o.delivered_at,
    oi.line_count,
    oi.revenue,
    timestamp_diff(o.delivered_at, o.ordered_at, day) as delivery_days
from orders as o
left join order_items as oi on o.order_id = oi.order_id