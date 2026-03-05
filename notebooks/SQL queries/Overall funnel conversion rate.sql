SELECT 
ROUND((order_count * 1.0 / page_count) * 100,2) AS Overall_conversion_rate

FROM
(SELECT COUNT(DISTINCT(session_id)) AS page_count from page_views),
(SELECT COUNT(DISTINCT(session_id)) AS order_count from orders)
