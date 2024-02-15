with source as (
    select *
    from {{ source('in.c-data_import', 'olist_order_reviews_dataset') }}
),
renamed as (
    select
        "review_id" as review_pk
        ,"order_id" as order_fk
        ,"review_score"::integer as review_score
    from source
)
select *
from renamed