-- View: public.month_peak_sale

-- DROP VIEW public.month_peak_sale;

CREATE OR REPLACE VIEW public.month_peak_sale
 AS
 SELECT date_trunc('month'::text, invoice_date::timestamp with time zone) AS month,
    sum(total) AS monthly_revenue
   FROM invoice
  GROUP BY (date_trunc('month'::text, invoice_date::timestamp with time zone))
  ORDER BY (sum(total)) DESC;

ALTER TABLE public.month_peak_sale
    OWNER TO postgres;

