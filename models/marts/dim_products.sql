with products as (
    select * from {{ ref('stg_products') }}
)
select
    product_id,
    product_name,
    category,
    brand,
    department,
    cost,
    retail_price
from products