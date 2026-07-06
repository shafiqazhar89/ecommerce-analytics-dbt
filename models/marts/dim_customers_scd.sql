with snapshot as (
    select * from {{ ref('snp_customers') }}
)

select
    dbt_scd_id                          as customer_key,
    id                                  as customer_id,
    first_name,
    last_name,
    age,
    gender,
    city,
    state,
    country,
    traffic_source,
    created_at                          as signed_up_at,
    dbt_valid_from                      as valid_from,
    dbt_valid_to                        as valid_to,
    case
        when dbt_valid_to is null then true
        else false
    end                                 as is_current
from snapshot