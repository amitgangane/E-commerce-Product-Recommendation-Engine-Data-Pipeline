-- models/staging/stg_ecommerce__products.sql
WITH source AS (
    SELECT
        product_id,
        product_name,
        category,
        price,
        stock_quantity
    FROM
        {{ source('ecommerce_raw', 'products') }}
)

SELECT
    product_id,
    product_name,
    category,
    price,
    stock_quantity
FROM
    source