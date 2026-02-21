-- View: public.customer_purchase

-- DROP VIEW public.customer_purchase;

CREATE OR REPLACE VIEW public.customer_purchase
 AS
 SELECT
        CASE
            WHEN purchase_count = 1 THEN 'One-time'::text
            ELSE 'Repeat'::text
        END AS customer_type,
    count(*) AS customer_count
   FROM ( SELECT invoice.customer_id,
            count(invoice.invoice_id) AS purchase_count
           FROM invoice
          GROUP BY invoice.customer_id) sub
  GROUP BY (
        CASE
            WHEN purchase_count = 1 THEN 'One-time'::text
            ELSE 'Repeat'::text
        END);

ALTER TABLE public.customer_purchase
    OWNER TO postgres;

