with source as (
    select *
    from {{ source('in.c-data_import', 'olist_products_dataset') }}
),
renamed as (
    select
        "product_id" as product_pk
        ,"product_category_name" as product_category_name
        ,TRY_CAST("product_name_lenght" AS integer) as product_name_lenght
        ,TRY_CAST("product_description_lenght" AS integer) as product_description_lenght
        ,TRY_CAST("product_photos_qty" AS integer) as product_photos_qty
        ,TRY_CAST("product_weight_g" AS integer) as product_weight_g
        ,TRY_CAST("product_length_cm" AS integer) as product_length_cm
        ,TRY_CAST("product_height_cm" AS integer) as product_height_cm
        ,TRY_CAST("product_width_cm" AS integer) as product_width_cm
    from source
)
select *
from renamed