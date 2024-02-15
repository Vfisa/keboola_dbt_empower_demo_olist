with source as (
    select *
    from {{ source('in.c-data_import', 'olist_order_items_dataset') }}
) ,
renamed as (
    select
        md5(concat("order_id"::VARCHAR(1024),'_',"order_item_id"::VARCHAR(1024))) as order_item_uiid
        ,"order_id"::varchar as order_fk
        ,"order_item_id"::integer as order_item_id
        ,"product_id"::varchar as product_fk
        ,"seller_id"::varchar as seller_fk
        ,"shipping_limit_date"::timestamp as shipping_limit_date
        ,"price"::decimal(15,2) as price
        ,"freight_value"::decimal(15,2) as freight_value
    from source
)
select *
from renamed