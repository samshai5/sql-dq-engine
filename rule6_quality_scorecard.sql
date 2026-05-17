-- ============================================================
-- Project: SQL Data Quality Rule Engine
-- File:    rule6_quality_scorecard.sql
-- Rule:    Summary — aggregate quality score across all rules
-- Author:  Sam Shaikh
-- ============================================================

SELECT
    'Null Check'        AS rule_name,
    'Completeness'      AS dimension,
    COUNT(*)            AS total_rows,
    SUM(CASE WHEN make IS NULL OR model IS NULL
             OR price IS NULL OR vin = ''
             THEN 1 ELSE 0 END) AS failed_rows,
    COUNT(*) - SUM(CASE WHEN make IS NULL OR model IS NULL
                        OR price IS NULL OR vin = ''
                        THEN 1 ELSE 0 END) AS passed_rows,
    ROUND(
        (COUNT(*) - SUM(CASE WHEN make IS NULL OR model IS NULL
                             OR price IS NULL OR vin = ''
                             THEN 1 ELSE 0 END))
        * 100.0 / COUNT(*), 1
    ) AS pass_rate_pct
FROM vehicle_inventory

UNION ALL

SELECT
    'Duplicate VIN',
    'Uniqueness',
    COUNT(*),
    COUNT(*) - COUNT(DISTINCT vin),
    COUNT(DISTINCT vin),
    ROUND(COUNT(DISTINCT vin) * 100.0 / COUNT(*), 1)
FROM vehicle_inventory
WHERE vin IS NOT NULL AND vin != ''

UNION ALL

SELECT
    'Price Validity',
    'Validity',
    COUNT(*),
    SUM(CASE WHEN price < 500 OR price > 500000 THEN 1 ELSE 0 END),
    COUNT(*) - SUM(CASE WHEN price < 500 OR price > 500000 THEN 1 ELSE 0 END),
    ROUND(
        (COUNT(*) - SUM(CASE WHEN price < 500 OR price > 500000 THEN 1 ELSE 0 END))
        * 100.0 / COUNT(*), 1
    )
FROM vehicle_inventory WHERE price IS NOT NULL

UNION ALL

SELECT
    'Year Accuracy',
    'Accuracy',
    COUNT(*),
    SUM(CASE WHEN year < 1980 OR year > 2026 THEN 1 ELSE 0 END),
    COUNT(*) - SUM(CASE WHEN year < 1980 OR year > 2026 THEN 1 ELSE 0 END),
    ROUND(
        (COUNT(*) - SUM(CASE WHEN year < 1980 OR year > 2026 THEN 1 ELSE 0 END))
        * 100.0 / COUNT(*), 1
    )
FROM vehicle_inventory

UNION ALL

SELECT
    'Status Consistency',
    'Consistency',
    COUNT(*),
    SUM(CASE WHEN status NOT IN ('Available','Sold','Pending') THEN 1 ELSE 0 END),
    COUNT(*) - SUM(CASE WHEN status NOT IN ('Available','Sold','Pending') THEN 1 ELSE 0 END),
    ROUND(
        (COUNT(*) - SUM(CASE WHEN status NOT IN ('Available','Sold','Pending') THEN 1 ELSE 0 END))
        * 100.0 / COUNT(*), 1
    )
FROM vehicle_inventory;
