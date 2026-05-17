-- ============================================================
-- Project: SQL Data Quality Rule Engine
-- File:    rule5_status_consistency.sql
-- Rule:    Consistency — status must be one of the approved values
-- Author:  Sam Shaikh
-- ============================================================

SELECT
    id,
    make,
    model,
    status,
    'Invalid status value — must be Available, Sold, or Pending' AS issue_type
FROM vehicle_inventory
WHERE status NOT IN ('Available', 'Sold', 'Pending')
ORDER BY id;
