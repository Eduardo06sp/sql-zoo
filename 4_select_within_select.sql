-- 1. List each country name where population is larger than Russia's
-- Answer is a modification of a pre-filled example
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- 2. Show European countries with per capita GDP greater than 'United Kingdom'
SELECT name
FROM world
WHERE (gdp / population) > (
  SELECT (gdp / population)
  FROM world
  WHERE name = 'United Kingdom')
AND continent = 'Europe';

-- 3. List name and continent of countries in the continents
--    containing either Argentine or Australia
--    order by name
SELECT name, continent
FROM world
WHERE continent = (
  SELECT continent
  FROM world
  WHERE name = 'Argentina')
OR continent = (
  SELECT continent
  FROM world
  WHERE name = 'Australia')
ORDER BY name;

-- 4. Which country has population more than Canada
--    but less than Poland?
--    Show name and population
SELECT name, population
FROM world
WHERE population > (
  SELECT population
  FROM world
  WHERE name = 'Canada')
AND population < (
  SELECT population
  FROM world
  WHERE name = 'Poland');

-- 5. Show name and population of each European country
--    Show population as percentage of Germany's population
--    Format as name, percentage
SELECT name, (
  CONCAT(
    ROUND((population / (
      SELECT population
      FROM world
      WHERE name = 'Germany') * 100), 0
    ), '%')
) AS percentage
FROM world
WHERE continent = 'Europe';

-- 6. Which countries have GDP greater than every European country?
--    Give name
--    Some countries may have NULL GDPs
SELECT name
FROM world
WHERE gdp > ALL(
  SELECT gdp
  FROM world
  WHERE continent = 'Europe'
  AND gdp IS NOT null);

-- 7. Find largest country (by area) in each continent
--    Show continent, name and area
-- Answer is a modification of a pre-filled example
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent = x.continent);

-- 8. List each continent and name of country
--    that comes first alphabetically
SELECT continent, name
FROM world x
WHERE name <= ALL(
  SELECT name
  FROM world y
  WHERE y.continent = x.continent);

-- 9. Find continents where all countries have population <= 25_000_000
--    Then find countries associated with these continents
--    Show name, continent and population
SELECT name, continent, population
FROM world x
WHERE 25000000 > ALL(
  SELECT population
  FROM world y
  WHERE x.continent = y.continent
);

-- 10. Give countries and continents
--     where country has population more than 3x higher population than other
--     countries in same continent
SELECT name, continent
FROM world x
WHERE population >= ALL(
  SELECT population * 3
  FROM world y
  WHERE x.continent = y.continent
  AND x.name != y.name
);
