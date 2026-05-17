-- ============================================================
-- Project: SQL Data Quality Rule Engine
-- File:    rule2_duplicate_vin.sql
-- Rule:    Uniqueness — VIN must appear exactly once
-- Author:  Sam Shaikh
-- ============================================================

SELECT
    vin,
    COUNT(*) AS occurrences,
    GROUP_CONCAT(id) AS affected_ids
FROM vehicle_inventory
WHERE
    vin IS NOT NULL
    AND vin != ''
GROUP BY vin
HAVING COUNT(*) > 1
ORDER BY occurrences DESC;
