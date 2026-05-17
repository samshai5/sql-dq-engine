-- ============================================================
-- Project: SQL Data Quality Rule Engine
-- File:    sample_data.sql
-- Description: Creates the vehicle_inventory table and loads
--              sample data with intentional quality issues
-- Author:  Sam Shaikh
-- ============================================================

-- Step 1: Create the table
CREATE TABLE IF NOT EXISTS vehicle_inventory (
    id     TEXT PRIMARY KEY,
    make   TEXT,
    model  TEXT,
    year   INTEGER,
    price  REAL,
    mileage INTEGER,
    color  TEXT,
    vin    TEXT,
    status TEXT
);

-- Step 2: Insert sample data (includes intentional data quality issues)
INSERT INTO vehicle_inventory VALUES
('V001','Toyota','Camry',2021,24500,18200,'Silver','1HGCM82633A004352','Available'),
('V002','Ford','F-150',2022,38900,9800,'Blue','1FTEX1EP0JFA12345','Available'),
('V003','Honda','Civic',2020,NULL,32100,'Red','2HGFC2F59LH123456','Sold'),        -- NULL price
('V004','Toyota','RAV4',2023,31200,2100,'White','JTMRFREV0JD123456','Available'),
('V005','Ford','Mustang',2019,29800,41200,'','1FA6P8TH5K5123456','Available'),    -- Missing color
('V006','Honda',NULL,2021,22100,27800,'Black','5YJSA1DN5DFP12345','Available'),   -- NULL model
('V007','Chevrolet','Silverado',2022,42000,15600,'Gray','3GCPCREC0GG123456','Pending'),
('V008','BMW','3 Series',2020,34500,28900,'Black','WBA8E9G50GNT12345','Available'),
('V009','Toyota','Camry',2021,24500,18200,'Silver','1HGCM82633A004352','Available'), -- Duplicate VIN
('V010','Nissan','Altima',2050,23400,19800,'White','1N4AL3AP2JC123456','Available'), -- Future year
('V011','Hyundai','Tucson',2022,-500,8200,'Blue','5NPE24AF8JH123456','Available'),   -- Negative price
('V012','Ford','Explorer',2021,36700,21300,'Red','1FMSK8DH4LGA12345','InvalidStatus'), -- Bad status
('V013','Kia','Sorento',2023,33100,4100,'Gray','5XYPG4A50KG123456','Available'),
('V014',NULL,'Accord',2020,28900,33200,'Silver','','Sold'),                          -- NULL make, missing VIN
('V015','Tesla','Model 3',2022,48200,11200,'White','5YJ3E1EA4LF123456','Available');
