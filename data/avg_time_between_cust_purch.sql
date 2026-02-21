CREATE VIEW avg_time_between_cust_purch AS SELECT 
    ROUND(AVG(days_between), 2) AS avg_days_between_purchases
FROM (
    SELECT 
        customer_id,
        invoice_date - LAG(invoice_date) 
            OVER (PARTITION BY customer_id ORDER BY invoice_date) 
        AS days_between
    FROM invoice
) sub
WHERE days_between IS NOT NULL;