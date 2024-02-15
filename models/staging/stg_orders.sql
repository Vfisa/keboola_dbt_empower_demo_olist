with source as (
    select *
    from {{ source('in.c-data_import', 'olist_orders_dataset') }}
),
renamed as (
    select
        "order_id"::varchar as order_pk
        ,"customer_id"::varchar as customer_fk
        ,CASE 
            WHEN "order_status"='delivered' THEN 'completed'
            WHEN "order_status"='canceled' THEN 'cancelled'
            ELSE 'in_progress'
        END AS order_status
        ,try_to_timestamp("order_purchase_timestamp") as order_purchase_date
        ,try_to_timestamp("order_approved_at") as order_approved_date
        ,try_to_timestamp("order_delivered_carrier_date") as order_delivered_carrier_date
        ,try_to_timestamp("order_delivered_customer_date") as order_delivered_customer_date
        ,try_to_timestamp("order_estimated_delivery_date") as order_estimated_delivery_date
        ,datediff(
            day
            ,try_to_timestamp("order_delivered_customer_date")
            ,try_to_timestamp("order_estimated_delivery_date")
        )::integer as est_delivery_delay
    from source
)
select *
from renamed