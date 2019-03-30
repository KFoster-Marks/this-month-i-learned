DROP materialized view IF EXISTS accounts;
CREATE materialized view accounts AS
    (
        SELECT row_number() OVER(order by account_name), account_name
        FROM ts_stat('select name from org.accounts')
    );

DROP index IF EXISTS org.accounts_idx_name;
CREATE index accounts_idx_name ON org.accounts USING gin(account_name extensions.gin_trgm_ops);