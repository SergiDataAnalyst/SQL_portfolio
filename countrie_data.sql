-- Create teh countries table
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

-- Inserting data into the countries table
INSERT INTO countries VALUES 
('China', 1439323776, 0.39, 5540090, 153, 9388211, -348399, 1.70, 38.00, 18.47),
('India', 1380004385, 0.99, 13586631, 464, 2973190, -532687, 2.20, 28.00, 17.7),
('Pakistan', 220892340, 2.00, 4327022, 287, 770880, -233379, 3.60, 23.00, 2.83),
('Brazil', 212559417, 0.72, 1509890, 25, 8358140, 21200, 1.70, 33.00, 2.73),
('Nigeria', 206139589, 2.58, 5175990, 226, 910770, -60000, 5.40, 18.00, 2.64),
('Bangladesh', 164689383, 1.01, 1643222, 1265, 130170, -369501, 2.10, 28.00, 2.11),
('Russia', 145934462, 0.04, 62206, 9, 16376870, 182456, 1.80, 40.00, 1.87),
('Mexico', 128932753, 1.06, 1357224, 66, 1943950, -60000, 2.10, 29.00, 1.65),
('Japan', 126476461, -0.30, -383840, 347, 364555, 71560, 1.40, 48.00, 1.62),
('Ethiopia', 114963588, 2.57, 2884858, 115, 1000000, 30000, 4.30, 19.00, 1.47),
('Philippines', 109581078, 1.35, 1464463, 368, 298170, -67152, 2.60, 26.00, 1.41),
('Egypt', 102334404, 1.94, 1946331, 103, 995450, -38033, 3.30, 25.00, 1.31),
('Vietnam', 97338579, 0.91, 876473, 314, 310070, -80000, 2.10, 32.00, 1.25),
('DR Congo', 89561403, 3.19, 2770836, 40, 2267050, 23861, 6.00, 17.00, 1.15),
('Turkey', 84339067, 1.09, 909452, 110, 769630, 283922, 2.10, 32.00, 1.08),
('Iran', 83992949, 1.30, 1079043, 52, 1628550, -55000, 2.20, 32.00, 1.08),
('Germany', 83783942, 0.32, 266897, 240, 348560, 543822, 1.60, 46.00, 1.07);

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
