-- View: public.avg_invoice_value

-- DROP VIEW public.avg_invoice_value;

CREATE OR REPLACE VIEW public.avg_invoice_value
 AS
 SELECT avg(total) AS avg_invoice_value
   FROM invoice;

ALTER TABLE public.avg_invoice_value
    OWNER TO postgres;

