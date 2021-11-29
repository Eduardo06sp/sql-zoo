-- 1. Show the population of Germany
-- Answer is a modification of a pre-filled example
SELECT population FROM world
  WHERE name = 'Germany';

-- 2. Show the name and population for Sweden, Norway and Denmark
-- Answer is a modification of a pre-filled example
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3. Show the countries with areas between 200_000 and 250_000
-- Answer is a modification of a pre-filled example
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
