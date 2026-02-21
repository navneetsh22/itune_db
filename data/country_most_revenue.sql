-- View: public.country_most_revenue

-- DROP VIEW public.country_most_revenue;

CREATE OR REPLACE VIEW public.country_most_revenue
 AS
 SELECT c.country,
    sum(i.total) AS total_revenue,
    count(DISTINCT c.customer_id) AS total_customers,
    sum(i.total) / count(DISTINCT c.customer_id)::numeric AS revenue_per_customer
   FROM customer c
     JOIN invoice i ON c.customer_id = i.customer_id
  GROUP BY c.country
  ORDER BY (sum(i.total) / count(DISTINCT c.customer_id)::numeric) DESC;

ALTER TABLE public.country_most_revenue
    OWNER TO postgres;

