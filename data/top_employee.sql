CREATE VIEW emp_reg_most_revenue AS SELECT 
    e.country,
    SUM(i.total) AS total_revenue
FROM employee e
JOIN customer c 
    ON e.employee_id = c.support_rep_id
JOIN invoice i 
    ON c.customer_id = i.customer_id
GROUP BY e.country
ORDER BY total_revenue DESC;