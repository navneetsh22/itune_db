CREATE VIEW most_popular_genre AS SELECT 
    g.genre_id,
    g.name AS genre_name,
    SUM(il.quantity) AS total_tracks_sold
FROM genre g
JOIN track t 
    ON g.genre_id = t.genre_id
JOIN invoice_line il 
    ON t.track_id = il.track_id
GROUP BY g.genre_id, g.name
ORDER BY total_tracks_sold DESC;