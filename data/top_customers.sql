-- View: public.top_customers

-- which customers have spent more money on music? 

CREATE OR REPLACE VIEW public.top_customers
 AS
 SELECT c.customer_id,
    c.first_name,
    c.last_name,
    sum(i.total) AS total_spent
   FROM customer c
     JOIN invoice i ON c.customer_id = i.customer_id
  GROUP BY c.customer_id, c.first_name, c.last_name
  ORDER BY (sum(i.total)) DESC;

ALTER TABLE public.top_customers
    OWNER TO postgres;

