-- View: public.revenue_trend

-- DROP VIEW public.revenue_trend;

CREATE OR REPLACE VIEW public.revenue_trend
 AS
 SELECT date_trunc('month'::text, invoice_date::timestamp with time zone) AS month,
    sum(total) AS monthly_revenue
   FROM invoice
  WHERE invoice_date >= (CURRENT_DATE - '2 years'::interval)
  GROUP BY (date_trunc('month'::text, invoice_date::timestamp with time zone))
  ORDER BY (date_trunc('month'::text, invoice_date::timestamp with time zone));

ALTER TABLE public.revenue_trend
    OWNER TO postgres;

