-- models/core/core_daily_product_performance.sql
SELECT
    CAST(event_at AS DATE) AS event_date,
    product_id,
    SUM(CASE WHEN event_type = 'purchase' THEN quantity ELSE 0 END) AS total_units_sold,
    SUM(CASE WHEN event_type = 'purchase' THEN price_at_event * quantity ELSE 0 END) AS total_revenue,
    COUNT(CASE WHEN event_type = 'view' THEN event_id END) AS total_views
FROM
    {{ ref('stg_ecommerce__interactions') }}
GROUP BY
    1, 2