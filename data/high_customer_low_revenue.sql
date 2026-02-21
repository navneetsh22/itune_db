CREATE VIEW customer_retention AS SELECT 
    purchase_count,
    COUNT(*) AS number_of_customers
FROM (
    SELECT 
        customer_id,
        COUNT(invoice_id) AS purchase_count
    FROM invoice
    GROUP BY customer_id
) sub
GROUP BY purchase_count
ORDER BY purchase_count;