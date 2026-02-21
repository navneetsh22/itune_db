-- View: public.customer_churn

-- DROP VIEW public.customer_churn;

CREATE OR REPLACE VIEW public.customer_churn
 AS
 SELECT c.customer_id,
    c.first_name,
    c.last_name,
    max(i.invoice_date) AS last_purchase_date
   FROM customer c
     LEFT JOIN invoice i ON c.customer_id = i.customer_id
  GROUP BY c.customer_id, c.first_name, c.last_name
 HAVING max(i.invoice_date) < (CURRENT_DATE - '6 mons'::interval) OR max(i.invoice_date) IS NULL;

ALTER TABLE public.customer_churn
    OWNER TO postgres;

