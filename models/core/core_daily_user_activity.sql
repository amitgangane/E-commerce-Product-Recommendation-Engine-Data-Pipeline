-- models/core/core_daily_user_activity.sql
SELECT
    CAST(event_at AS DATE) AS activity_date,
    user_id,
    COUNT(CASE WHEN event_type = 'view' THEN event_id END) AS views_count,
    COUNT(CASE WHEN event_type = 'add_to_cart' THEN event_id END) AS add_to_cart_count,
    COUNT(CASE WHEN event_type = 'purchase' THEN event_id END) AS purchase_count,
    COUNT(DISTINCT product_id) AS distinct_products_interacted
FROM
    {{ ref('stg_ecommerce__interactions') }}
GROUP BY
    1, 2