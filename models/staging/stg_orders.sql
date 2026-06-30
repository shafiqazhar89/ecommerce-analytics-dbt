with source as (
    select * from {{ source('thelook', 'orders') }}
)
select
    order_id,
    user_id              as customer_id,
    status               as order_status,
    created_at           as ordered_at,
    delivered_at,
    num_of_item          as item_count
from source