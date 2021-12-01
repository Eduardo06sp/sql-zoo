-- 1. Example of SUM showing the world's population

-- 2. List all the continents
--    Just once each
SELECT DISTINCT continent
FROM world;

-- 3. Give total GDP of Africa
SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa';

-- 4. Show countries with area of at least 1_000_000
SELECT COUNT(name)
FROM world
WHERE area >= 1000000;

-- 5. What is the total population of ('Estonia', 'Latvia', 'Lithuania')
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- 6. Show continent and number of countries
--    for each continent
SELECT continent, COUNT(name)
FROM world
GROUP BY continent;

-- 7. For each continent
--    show continent and 
--    number of countries w/ population of at least 10 million
SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent;

-- 8. List continents that have
--    total population of at least 100 million
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;
