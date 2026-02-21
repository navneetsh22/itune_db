-- View: public.sales_rep_revenue

-- DROP VIEW public.sales_rep_revenue;

CREATE OR REPLACE VIEW public.sales_rep_revenue
 AS
 SELECT e.employee_id,
    e.first_name,
    e.last_name,
    sum(i.total) AS total_revenue
   FROM employee e
     JOIN customer c ON e.employee_id = c.support_rep_id
     JOIN invoice i ON c.customer_id = i.customer_id
  GROUP BY e.employee_id, e.first_name, e.last_name
  ORDER BY (sum(i.total)) DESC;

ALTER TABLE public.sales_rep_revenue
    OWNER TO postgres;

