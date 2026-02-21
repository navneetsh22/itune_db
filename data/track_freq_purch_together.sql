CREATE VIEW track_freq_purch_together AS SELECT 
    il1.track_id AS track_1,
    il2.track_id AS track_2,
    COUNT(*) AS times_bought_together
FROM invoice_line il1
JOIN invoice_line il2
    ON il1.invoice_id = il2.invoice_id
    AND il1.track_id < il2.track_id
GROUP BY il1.track_id, il2.track_id
ORDER BY times_bought_together DESC
LIMIT 10;