{{ config(
    materialized="table"
) }}

with customers as (
    select * from {{ ref('stg_customers') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),


customers_orders_payments as (
    select
        distinct(customers.customer_fk) as customer_id
        ,customers.customer_uiid
        ,count(orders.order_pk)::integer as number_of_orders
        ,min(orders.order_purchase_date)::timestamp as first_order
        ,max(orders.order_purchase_date)::timestamp as recent_order
        ,sum(payments.payment_value)::decimal(15,2) as customer_lifetime_value
    from orders
    left join customers on orders.customer_fk = customers.customer_fk
    left join payments on orders.order_pk = payments.order_fk
    group by 1, 2

),

final as (
    select
        distinct(customer_uiid) AS customer_uiid
        ,SUM(customers_orders_payments.number_of_orders) AS number_of_orders
        ,min(customers_orders_payments.first_order) AS first_order
        ,MAX(customers_orders_payments.recent_order) AS recent_order
        ,SUM(customers_orders_payments.customer_lifetime_value) AS customer_lifetime_value
    from
        customers_orders_payments
    GROUP BY 1
)

select * from final

