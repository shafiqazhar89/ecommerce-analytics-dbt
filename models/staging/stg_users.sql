with source as (
    select * from {{ source('thelook', 'users') }}
)
select
    id              as customer_id,
    first_name,
    last_name,
    age,
    gender,
    city,
    state,
    country,
    traffic_source,
    created_at      as signed_up_at
from source