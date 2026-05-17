-- ============================================================
-- Project: SQL Data Quality Rule Engine
-- File:    rule1_null_check.sql
-- Rule:    Completeness — required fields must not be NULL
-- Author:  Sam Shaikh
-- ============================================================

SELECT
    id,
    make,
    model,
    price,
    vin,
    CASE
        WHEN make  IS NULL OR make  = '' THEN 'Missing MAKE'
        WHEN model IS NULL OR model = '' THEN 'Missing MODEL'
        WHEN price IS NULL              THEN 'Missing PRICE'
        WHEN vin   IS NULL OR vin   = '' THEN 'Missing VIN'
    END AS failure_reason
FROM vehicle_inventory
WHERE
    make  IS NULL OR make  = ''
    OR model IS NULL OR model = ''
    OR price IS NULL
    OR vin   IS NULL OR vin   = ''
ORDER BY id;
