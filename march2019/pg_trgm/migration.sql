DROP materialized view IF EXISTS search_account;
CREATE materialized view search_account AS (
    SELECT 
        COALESCE(acct.name, ''::character varying) AS name,
        COALESCE(acct.type, ''::character varying) AS type,
        (COALESCE(acct.name, ''::character varying)::text) AS search_fields,
        (setweight(to_tsvector(COALESCE(acct.name, ''::character varying)::text), 'A'::"char")) AS search_document
    FROM org.accounts acct
    WHERE acct.type::text = ANY (ARRAY['Primary'::character varying::text, 'Billing'::character varying::text])
    ORDER BY (COALESCE(acct.name, ''::character varying));
);

DROP index IF EXISTS org.accounts_idx_name;
CREATE index search_account_idx_name ON org.accounts USING gin(account_name extensions.gin_trgm_ops);
