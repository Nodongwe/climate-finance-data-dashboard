-- =========================================
-- Climate & Financial Risk Analysis Project
-- SQL Queries File
-- =========================================

-- 1. Create table
CREATE TABLE climate_data (
    id INTEGER,
    region TEXT,
    event_type TEXT,
    sector TEXT,
    impact_level TEXT,
    estimated_cost_million INTEGER
);

-- =========================================
-- BASIC DATA CHECK
-- =========================================

-- 2. View all data
SELECT * FROM climate_data;

-- 3. View first 5 records
SELECT * FROM climate_data
LIMIT 5;

-- =========================================
-- FINANCIAL IMPACT ANALYSIS
-- =========================================

-- 4. Total financial impact by region
SELECT region,
       SUM(estimated_cost_million) AS total_cost
FROM climate_data
GROUP BY region
ORDER BY total_cost DESC;

-- 5. Total financial impact by sector
SELECT sector,
       SUM(estimated_cost_million) AS total_cost
FROM climate_data
GROUP BY sector
ORDER BY total_cost DESC;

-- 6. Total financial impact by event type
SELECT event_type,
       SUM(estimated_cost_million) AS total_cost
FROM climate_data
GROUP BY event_type
ORDER BY total_cost DESC;

-- =========================================
-- FREQUENCY ANALYSIS
-- =========================================

-- 7. Count of climate events by type
SELECT event_type,
       COUNT(*) AS event_count
FROM climate_data
GROUP BY event_type
ORDER BY event_count DESC;

-- 8. Count of events by region
SELECT region,
       COUNT(*) AS event_count
FROM climate_data
GROUP BY region
ORDER BY event_count DESC;

-- =========================================
-- RISK / IMPACT ANALYSIS
-- =========================================

-- 9. Average cost per event type
SELECT event_type,
       AVG(estimated_cost_million) AS avg_cost
FROM climate_data
GROUP BY event_type
ORDER BY avg_cost DESC;

-- 10. Impact level vs total cost
SELECT impact_level,
       SUM(estimated_cost_million) AS total_cost
FROM climate_data
GROUP BY impact_level
ORDER BY total_cost DESC;

-- =========================================
-- INSIGHT QUERIES (PORTFOLIO LEVEL)
-- =========================================

-- 11. Highest cost event
SELECT *
FROM climate_data
ORDER BY estimated_cost_million DESC
LIMIT 1;

-- 12. Most affected region (by total cost)
SELECT region,
       SUM(estimated_cost_million) AS total_cost
FROM climate_data
GROUP BY region
ORDER BY total_cost DESC
LIMIT 1;

-- 13. Most financially damaging sector
SELECT sector,
       SUM(estimated_cost_million) AS total_cost
FROM climate_data
GROUP BY sector
ORDER BY total_cost DESC
LIMIT 1;
