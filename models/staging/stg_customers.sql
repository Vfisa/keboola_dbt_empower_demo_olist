with source as (
    select *
    from {{ source('in.c-keboola-ex-storage-35723326', 'olist_customers_dataset') }}
) ,
renamed as (
    select
        "customer_id"::varchar as customer_fk
        ,"customer_unique_id"::varchar as customer_uiid
        ,"customer_city"::varchar as customer_city
        ,"customer_state"::varchar as customer_state
    from source
)
select *
from renamed