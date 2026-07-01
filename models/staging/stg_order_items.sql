with source as (
    select * from {{ source('thelook', 'order_items') }}
)
select
    id                as order_item_id,
    order_id,
    user_id           as customer_id,
    product_id,
    sale_price
from source