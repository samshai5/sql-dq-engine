-- ============================================================
-- Project: SQL Data Quality Rule Engine
-- File:    rule4_year_accuracy.sql
-- Rule:    Accuracy — model year must be between 1980 and current year
-- Author:  Sam Shaikh
-- ============================================================

SELECT
    id,
    make,
    model,
    year,
    CASE
        WHEN year < 1980 THEN 'Year too old (before 1980)'
        WHEN year > 2026 THEN 'Future year — invalid'
    END AS issue_type
FROM vehicle_inventory
WHERE
    year < 1980
    OR year > 2026
ORDER BY year;
