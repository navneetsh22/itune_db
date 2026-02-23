-- AVG customer lifetime value create view avg_clv as SELECT 
    AVG(customer_total) AS avg_customer_lifetime_value
FROM (
    SELECT 
        c.customer_id,
        SUM(i.total) AS customer_total
    FROM customer c
    JOIN invoice i 
        ON c.customer_id = i.customer_id
    GROUP BY c.customer_id
) s