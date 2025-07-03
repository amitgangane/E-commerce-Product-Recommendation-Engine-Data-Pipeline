-- models/staging/stg_ecommerce__users.sql
WITH source AS (
    SELECT
        user_id,
        email,
        registration_date,
        country,
        marketing_opt_in
    FROM
        {{ source('ecommerce_raw', 'users') }}
)

SELECT
    user_id,
    email,
    PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', registration_date) AS registered_at,
    country,
    marketing_opt_in
FROM
    source