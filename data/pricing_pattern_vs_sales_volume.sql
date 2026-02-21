CREATE VIEW pricing_pattern_vs_sales_volume AS SELECT 
    t.unit_price,
    SUM(il.quantity) AS total_units_sold,
    SUM(il.unit_price * il.quantity) AS total_revenue
FROM track t
JOIN invoice_line il 
    ON t.track_id = il.track_id
GROUP BY t.unit_price
ORDER BY t.unit_price;