# SQL Data Quality Rule Engine

**Author:** Sam Shaikh  
**Tools:** SQL (SQLite / PostgreSQL compatible), Data Quality, Data Governance  
**Dataset:** Vehicle inventory (15 rows with intentional data quality issues)

## Overview
A data quality validation framework built entirely in SQL. Covers all 5 core DQ dimensions using custom rules against a vehicle inventory dataset — the same type of data used in automotive enterprise environments.

## Files

| File | Dimension | Description |
|------|-----------|-------------|
| `sample_data.sql` | — | Creates table and loads sample data with intentional flaws |
| `rule1_null_check.sql` | Completeness | Finds NULL or empty required fields |
| `rule2_duplicate_vin.sql` | Uniqueness | Detects duplicate VIN numbers |
| `rule3_price_validity.sql` | Validity | Flags prices outside $500–$500,000 range |
| `rule4_year_accuracy.sql` | Accuracy | Catches impossible model years |
| `rule5_status_consistency.sql` | Consistency | Validates status against approved values |
| `rule6_quality_scorecard.sql` | Summary | Aggregates pass/fail rate across all rules |

## Intentional Data Issues in Sample Dataset

| Row | Issue | Rule That Catches It |
|-----|-------|----------------------|
| V003 | NULL price | Rule 1 — Null Check |
| V006 | NULL model | Rule 1 — Null Check |
| V014 | NULL make, missing VIN | Rule 1 — Null Check |
| V009 | Duplicate VIN (same as V001) | Rule 2 — Duplicate VIN |
| V011 | Negative price (-$500) | Rule 3 — Price Validity |
| V010 | Future year (2050) | Rule 4 — Year Accuracy |
| V012 | Invalid status ("InvalidStatus") | Rule 5 — Status Consistency |

## How to Run
1. Download **DB Browser for SQLite** (free) at sqlitebrowser.org
2. Open it → click "New Database" → save as `vehicle_dq.db`
3. Go to "Execute SQL" tab
4. Run `sample_data.sql` first to create and load the table
5. Run each rule file in order — review the results

## Results Summary

| Rule | Failures | Pass Rate |
|------|----------|-----------|
| Null Check | 3 rows | 80.0% |
| Duplicate VIN | 1 VIN | 93.3% |
| Price Validity | 1 row | 93.3% |
| Year Accuracy | 1 row | 93.3% |
| Status Consistency | 1 row | 93.3% |
| **Overall Score** | **7 issues** | **90.7%** |
