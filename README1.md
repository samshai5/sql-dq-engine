# SQL Data Quality Rule Engine

**Author:** Sam Shaikh · [github.com/samshai5](https://github.com/samshai5)  
**Stack:** SQL (SQLite / PostgreSQL compatible) · Data Quality · Data Governance  
**Dataset:** Vehicle inventory dataset (15 rows with intentional data quality issues)  
**Status:** ✅ Complete

---

## Overview

A modular **data quality (DQ) validation rule engine** built entirely in SQL. Designed to mirror real-world enterprise data quality workflows, this engine validates vehicle inventory data across all **5 core DQ dimensions** — completeness, uniqueness, validity, accuracy, and consistency — using structured SQL rules and a summary scorecard.

This project demonstrates the kind of data validation logic used in production automotive data platforms, dealership management systems, and enterprise inventory databases.

---

## Why This Project

Every enterprise database has bad data hiding in it. A duplicate VIN can break inventory tracking. A NULL price field can crash a pricing algorithm. An impossible model year (2050) can corrupt downstream analytics. This engine was built to catch those issues systematically — before they cause problems.

---

## Data Quality Dimensions Covered

| Dimension | Rule | What It Catches |
|---|---|---|
| **Completeness** | Rule 1 | NULL or empty required fields (make, model, price, VIN) |
| **Uniqueness** | Rule 2 | Duplicate VIN numbers across records |
| **Validity** | Rule 3 | Prices outside the valid range ($500 – $500,000) |
| **Accuracy** | Rule 4 | Impossible model years (future years, unrealistic past) |
| **Consistency** | Rule 5 | Status values not matching approved list |
| **Summary** | Rule 6 | Aggregated pass/fail scorecard across all rules |

---

## Project Files

| File | Purpose |
|---|---|
| `sample_data.sql` | Creates the `VEHICLE_INVENTORY` table and loads 15 rows — including 7 intentional data quality issues |
| `rule1_null_check.sql` | Completeness — finds NULL or empty required fields |
| `rule2_duplicate_vin.sql` | Uniqueness — detects duplicate VIN numbers |
| `rule3_price_validity.sql` | Validity — flags prices outside the $500–$500,000 acceptable range |
| `rule4_year_accuracy.sql` | Accuracy — catches impossible model years |
| `rule5_status_consistency.sql` | Consistency — validates status field against approved values list |
| `rule6_quality_scorecard.sql` | Summary — aggregates all rule results into a single pass/fail scorecard |

---

## Intentional Data Issues in Sample Dataset

The dataset was deliberately designed with 7 data quality issues — one per rule category — to validate that each rule catches exactly what it should:

| Record | Issue | Rule That Catches It |
|---|---|---|
| V003 | NULL price | Rule 1 — Null Check |
| V006 | NULL model | Rule 1 — Null Check |
| V014 | NULL make + missing VIN | Rule 1 — Null Check |
| V009 | Duplicate VIN (same as V001) | Rule 2 — Duplicate VIN |
| V011 | Negative price (-$500) | Rule 3 — Price Validity |
| V010 | Future model year (2050) | Rule 4 — Year Accuracy |
| V012 | Invalid status value ("InvalidStatus") | Rule 5 — Status Consistency |

---

## Results Summary

| Rule | Failures | Pass Rate |
|---|---|---|
| Null Check | 3 rows | 80.0% |
| Duplicate VIN | 1 VIN | 93.3% |
| Price Validity | 1 row | 93.3% |
| Year Accuracy | 1 row | 93.3% |
| Status Consistency | 1 row | 93.3% |
| **Overall Score** | **7 issues** | **90.7%** |

---

## Key Technical Highlights

- **Modular Rule Design** — each rule is a standalone `.sql` file, making it easy to add, remove, or swap individual checks without touching the rest of the engine
- **Intentional Test Data** — sample dataset was engineered with specific flaws to validate rule coverage end-to-end
- **Scorecard Aggregation** — `rule6_quality_scorecard.sql` combines all rule results into a single summary table for reporting
- **Cross-Database Compatibility** — written in standard SQL, compatible with SQLite, PostgreSQL, MySQL, and Snowflake
- **Automotive Domain Knowledge** — rules reflect real business logic used in dealership and OEM data systems (VIN uniqueness, valid model years, price ranges)

---

## How to Run

1. Download **DB Browser for SQLite** (free) at [sqlitebrowser.org](https://sqlitebrowser.org)
2. Open it → click **"New Database"** → save as `vehicle_dq.db`
3. Go to the **"Execute SQL"** tab
4. Run files in this order:

```sql
-- Step 1: Create and load the dataset
sample_data.sql

-- Step 2: Run each rule
rule1_null_check.sql
rule2_duplicate_vin.sql
rule3_price_validity.sql
rule4_year_accuracy.sql
rule5_status_consistency.sql

-- Step 3: View the full scorecard
rule6_quality_scorecard.sql
```

---

## Skills Demonstrated

`SQL` `Data Quality Validation` `Data Governance` `Database Design` `Modular Architecture` `Automotive Data` `Null Detection` `Duplicate Detection` `Outlier Flagging` `Data Consistency Rules` `SQLite` `PostgreSQL` `Debugging & Testing`

---

## Related Projects

- 🔗 [snowflake-dq-project](https://github.com/samshai5/snowflake-dq-project) — Enterprise DQ framework built in Snowflake with 1,240 vehicle records
- 🔗 [dq-dashboard](https://github.com/samshai5/dq-dashboard) — Frontend dashboard for visualizing data quality results
- 🔗 [Trading](https://github.com/samshai5/Trading) — AI-powered trading application

---

*Built by Sam Shaikh — Computer Science student at the University of Houston, passionate about data quality, automotive data, and building systems that keep bad data out of production.*
