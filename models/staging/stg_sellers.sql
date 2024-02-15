with source as (
    select *
    from {{ source('in.c-keboola-ex-storage-35723326', 'olist_sellers_dataset') }}
),
renamed as (
    select
        "seller_id" as seller_fk
        ,"seller_city" as seller_city
        ,"seller_state" as seller_state
    from source
)
select *
from renamed