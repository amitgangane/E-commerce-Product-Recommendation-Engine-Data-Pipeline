-- models/staging/stg_ecommerce__users.sql
WITH source AS (
    SELECT
        user_id,
        email,
        registration_date, -- This is already TIMESTAMP, no PARSE_TIMESTAMP needed
        country,
        marketing_opt_in
    FROM
        {{ source('ecommerce_raw', 'users') }}
)

SELECT
    user_id,
    email,
    registration_date AS registered_at, -- Simply rename, it's already a TIMESTAMP
    country,
    marketing_opt_in
FROM
    source