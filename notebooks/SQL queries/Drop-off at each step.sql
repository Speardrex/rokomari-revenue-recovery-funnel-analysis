WITH funnel_counts AS (
    SELECT
        (SELECT COUNT(DISTINCT session_id) FROM page_views) as total_visitors,
        (SELECT COUNT(DISTINCT session_id) FROM add_to_cart) as cart_adders,
        (SELECT COUNT(DISTINCT session_id) FROM checkout) as checkouts,
        (SELECT COUNT(DISTINCT session_id) FROM orders) as purchasers
)
SELECT 'page_views' AS stage,
       ROUND((1 - total_visitors * 1.0 / total_visitors) * 100, 2) || '%' AS drop_off
FROM funnel_counts

UNION ALL

SELECT 'add_to_cart',
       ROUND((1 - cart_adders * 1.0 / total_visitors) * 100, 2) || '%'
FROM funnel_counts

UNION ALL

SELECT 'checkout_started',
       ROUND((1 - checkouts * 1.0 / cart_adders) * 100, 2) || '%'
FROM funnel_counts

UNION ALL

SELECT 'orders',
       ROUND((1 - purchasers * 1.0 / checkouts) * 100, 2) || '%'
FROM funnel_counts;