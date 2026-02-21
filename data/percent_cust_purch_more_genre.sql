CREATE VIEW percent_cust_purch_more_genre AS SELECT 
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE genre_count > 1)
        / COUNT(*),
        2
    ) AS percentage_multi_genre_customers
FROM (
    SELECT 
        i.customer_id,
        COUNT(DISTINCT t.genre_id) AS genre_count
    FROM invoice i
    JOIN invoice_line il 
        ON i.invoice_id = il.invoice_id
    JOIN track t 
        ON il.track_id = t.track_id
    GROUP BY i.customer_id
) sub;