-- 1. Example of what the table data looks like

-- 2. Show name for countries with population of at least 200 million
-- Answer is a modification of a pre-filled example
SELECT name FROM world
WHERE population >= 200000000;

-- 3. Show name and per capita GDP for countries with population of at least 200 million
--    Per capita GDP = GDP / population
SELECT name, (gdp / population) FROM world
WHERE population >= 200000000;

-- 4. Show name and population (in millions) for South American countries
--    Divide population by 1_000_000 to get it in millions
SELECT name, (population / 1000000) FROM world
WHERE continent = 'South America';

-- 5. Show name and population for France, Germany, Italy
SELECT name, population FROM world
WHERE name IN ('France', 'Germany', 'Italy');

-- 6. Show countries with names including 'United'
SELECT name FROM world
WHERE name LIKE '%United%';

-- 7. Show countries that are big by area or big by population
--    Show name, population and area
--    Country is big if:
--      Area is more than 3 million sq km
--      Population is more than 250 million
SELECT name, population, area FROM world
WHERE area > 3000000
OR population > 250000000;

-- 8. Show countries that are big by area or big by population (but not both)
--    Show name, population and area
SELECT name, population, area FROM world
WHERE area > 3000000
XOR population > 250000000;

-- 9. Show the name and population (in millions) and GDP (in billions)
--    for South American countries
--    ROUND to 2 decimal places
SELECT name, ROUND((population / 1000000), 2), ROUND((gdp / 1000000000), 2)
FROM world
WHERE continent = 'South America';

-- 10. Show the name and per-capita GDP for countries
--     with GDP of at least one trillion
--     Round to the nearest 1000
SELECT name, ROUND((gdp / population), -3)
FROM world
WHERE gdp >= 1000000000000;

-- 11. Show the name and capital
--     where the name and the capital have the same number of characters
-- Answer is a modification of a pre-filled example
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);

-- 12. Show the name and capital where the first letters match
--     Don't include countries where the name and capital are the same word
-- Answer is a modification of a pre-filled example
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1)
AND name != capital;

-- 13. Find the country that has all the vowels and no spaces in its name
-- Answer is a modification of a pre-filled example
SELECT name
   FROM world
WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND name NOT LIKE '% %';
