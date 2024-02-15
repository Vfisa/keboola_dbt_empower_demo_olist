{{ config(
    materialized="table"
) }}


with 

orders as  (
    select * from {{ ref('stg_orders' )}}
),

customers as (
    select * from {{ref('stg_customers')}}
),

order_payments as (
    select * from {{ ref('stg_payments') }}
),

order_reviews as (
    select * from {{ref('stg_reviews')}}
),

orders_and_payments as (
    select
        *
    from
        orders
    left join order_payments on orders.order_pk = order_payments.order_fk

),

orders_and_locations as (
    select 
        orders_and_payments.*
        ,customers.customer_uiid
        ,customers.customer_city
    from
        orders_and_payments
    left join customers on customers.customer_fk = orders_and_payments.customer_fk
),
final as (

    select 
         order_pk as order_id
        ,customer_uiid
        ,order_status
        ,order_purchase_date
        ,order_approved_date
        ,order_delivered_carrier_date
        ,order_delivered_customer_date
        ,order_estimated_delivery_date
        ,est_delivery_delay
        ,numb_payment_methods
        ,payment_type
        ,payment_installments
        ,payment_value
        ,customer_city as delivery_city
    from
        orders_and_locations
)
select * from final