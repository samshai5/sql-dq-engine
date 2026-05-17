-- ============================================================
-- Project: SQL Data Quality Rule Engine
-- File:    rule3_price_validity.sql
-- Rule:    Validity — price must be between $500 and $500,000
-- Author:  Sam Shaikh
-- ============================================================

SELECT
    id,
    make,
    model,
    price,
    CASE
        WHEN price < 500    THEN 'Below minimum ($500)'
        WHEN price > 500000 THEN 'Above maximum ($500,000)'
    END AS issue_type
FROM vehicle_inventory
WHERE
    price IS NOT NULL
    AND (
        price < 500
        OR price > 500000
    )
ORDER BY price;
