{% snapshot snp_customers %}

{{
    config(
        target_schema='snapshots',
        unique_key='id',
        strategy='check',
        check_cols=['city', 'state', 'country', 'traffic_source'],
    )
}}

select
    id,
    first_name,
    last_name,
    email,
    age,
    gender,
    city,
    state,
    country,
    traffic_source,
    created_at
from {{ source('thelook', 'users') }}

{% endsnapshot %}