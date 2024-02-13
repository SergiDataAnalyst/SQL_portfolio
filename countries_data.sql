-- Create a table to store country data
CREATE TABLE countries(
   name TEXT PRIMARY KEY,
   population INTEGER,
   percent_one_year_change REAL,
   population_change INTEGER,
   density_per_sq_km INTEGER,
   area_sq_km INTEGER,
   net_migrants INTEGER,
   fertility_rate REAL,
   median_age REAL,
   percent_of_world_pop REAL
);

-- Insert data into the countries table
INSERT INTO countries VALUES 
('China', 1439323776, 0.39, 5540090, 153, 9388211, -348399, 1.70, 38.00, 18.47),
('India', 1380004385, 0.99, 13586631, 464, 2973190, -532687, 2.20, 28.00, 17.7),
-- (additional rows of data)
;

-- Select countries with a population greater than 10 million and order by population
SELECT name, population FROM countries 
WHERE population > 10000000 
ORDER BY population DESC;

-- Group countries by population using CASE
SELECT name, 
    CASE
        WHEN population > 10000000 THEN 'above 10 million'
        WHEN population > 1000000 THEN '1-10 million'
        WHEN population > 100000 THEN '100,000-1 million'
        WHEN population > 10000 THEN '10,000-100,000'
        ELSE 'below 10,000'
    END AS 'population group'
FROM countries
ORDER BY population DESC;

-- Find the median age in countries with the highest fertility rates
SELECT name, fertility_rate, median_age FROM countries 
WHERE fertility_rate > 3 
ORDER BY fertility_rate DESC;

-- Identify the countries with the fastest-growing populations this year
SELECT name AS 'fastest-growing populations', percent_one_year_change AS 'one year population change (%)' FROM countries 
WHERE percent_one_year_change > 2 
ORDER BY percent_one_year_change DESC;
