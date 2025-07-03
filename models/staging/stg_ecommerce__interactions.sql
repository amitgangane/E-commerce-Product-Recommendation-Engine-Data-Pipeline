-- models/staging/stg_ecommerce__interactions.sql
WITH source AS (
    SELECT
        event_id,
        user_id,
        product_id,
        event_type,
        event_timestamp, -- This is already TIMESTAMP, no PARSE_TIMESTAMP needed
        quantity,
        price_at_event,
        session_id
    FROM
        {{ source('ecommerce_raw', 'interactions') }}
)

SELECT
    event_id,
    user_id,
    product_id,
    event_type,
    event_timestamp AS event_at, -- Simply rename, it's already a TIMESTAMP
    CAST(quantity AS INT64) AS quantity, -- Ensure quantity is INT64
    CAST(price_at_event AS NUMERIC) AS price_at_event, -- Use NUMERIC for monetary values
    session_id
FROM
    source