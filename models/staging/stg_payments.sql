with source as (
    select *
    from {{ source('in.c-keboola-ex-storage-35723326','olist_order_payments_dataset' ) }}
),
renamed as (
    select
        "order_id"::varchar as order_fk
        ,"payment_sequential"::integer as numb_payment_methods
        ,"payment_type" as payment_type
        ,"payment_installments"::integer as payment_installments
        ,"payment_value"::decimal(15,2) as payment_value
    from source
)
select *
from renamed