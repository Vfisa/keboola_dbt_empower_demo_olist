{{ config(
    materialized="table"
) }}


with sellers as (

    select * from {{ ref('stg_sellers') }}

),
order_items as (
    select * from {{ ref('stg_order_items')}}
),

orders_by_sellers as (
    select
    seller_fk as seller_id
    ,sum(price) as price
    ,count(distinct(order_fk)) as numb_orders
    ,(sum(price) / count(order_fk))::integer as avg_order_price
    from
        order_items
    group by 1

),
final as (
    select 
    orders_by_sellers.seller_id
    ,orders_by_sellers.price
    ,orders_by_sellers.numb_orders
    ,orders_by_sellers.avg_order_price
    ,sellers.seller_city
    ,sellers.seller_state
    from
        orders_by_sellers
    left join sellers on orders_by_sellers.seller_id = sellers.seller_fk

)
select * from final
