-- TODOs:
-- Create DB
-- Create schema
-- Create table
-- Seed table

-- Create MV
DROP materialized view IF EXISTS text_search_account;
CREATE materialized view text_search_account AS (
    SELECT 
        COALESCE(acct.acct_name, ''::character varying) AS acct_name,
        COALESCE(acct.type, ''::character varying) AS type,
        (COALESCE(acct.acct_name, ''::character varying)::text) AS search_fields,
        (setweight(to_tsvector(COALESCE(acct.acct_name, ''::character varying)::text), 'A'::"char")) AS search_document
    FROM org.accounts acct
    WHERE acct.type::text = ANY (ARRAY['Primary'::character varying::text, 'Billing'::character varying::text])
    ORDER BY (COALESCE(acct.acct_name, ''::character varying));
);

-- Create GIN index
DROP index IF EXISTS org.accounts_idx_acct_name;
CREATE index text_search_account_idx_acct_name ON org.accounts USING gin(account_name extensions.gin_trgm_ops);
