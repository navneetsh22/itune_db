CREATE VIEW high_customer_low_revenue AS SELECT 
    c.country,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    SUM(i.total) AS total_revenue,
    ROUND(SUM(i.total) / COUNT(DISTINCT c.customer_id), 2) AS revenue_per_customer
FROM customer c
LEFT JOIN invoice i 
    ON c.customer_id = i.customer_id
GROUP BY c.country
ORDER BY total_customers DESC;