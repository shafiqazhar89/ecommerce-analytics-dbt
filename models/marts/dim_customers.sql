with customers as (
    select * from {{ ref('dim_customers_scd') }}
    where is_current = true
)
select
    customer_id,
    first_name,
    last_name,
    age,
    gender,
    city,
    state,
    country,
    traffic_source,
    signed_up_at
from customers