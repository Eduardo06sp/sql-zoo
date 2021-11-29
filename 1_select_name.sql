-- 1. Find the country that starts with Y
-- Answer is a modification of a pre-filled example
SELECT name FROM world
  WHERE name LIKE 'Y%';

-- 2. Find the countries that end with Y
-- Answer is a modification of a pre-filled example
SELECT name FROM world
  WHERE name LIKE '%Y';

-- 3. Find the countries that contain x
-- Answer is a modification of a pre-filled example
SELECT name FROM world
  WHERE name LIKE '%x%';

-- 4. Find the countries that end with land
-- Answer is a modification of a pre-filled example
SELECT name FROM world
  WHERE name LIKE '%land';

-- 5. Find the countries that start with C and end with -ia
-- Answer is a modification of a pre-filled example
SELECT name FROM world
  WHERE name LIKE 'C%ia';

-- 6. Find the country containing oo
-- Answer is a modification of a pre-filled example
SELECT name FROM world
  WHERE name LIKE '%oo%';

-- 7. Find the countries with three or more a's
-- Answer is a modification of a pre-filled example
SELECT name FROM world
  WHERE name LIKE '%a%a%a%';

-- 8. Find the countries that have a t as their 2nd character
-- Answer is a modification of a pre-filled example
SELECT name FROM world
  WHERE name LIKE '_t%'
ORDER BY name;

-- 9. Find the countries that have 2 o's separated by 2 other characters
-- Answer is a modification of a pre-filled example
SELECT name FROM world
  WHERE name LIKE '%o__o%';

-- 10. Find countries with exactly 4 characters
-- Answer is a modification of a pre-filled example
SELECT name FROM world
  WHERE name LIKE '____';

----------------------------
-- Harder Questions
----------------------------

-- 11. Find the country where the name is the capital city
-- Answer is a modification of a pre-filled example
SELECT name FROM world
  WHERE name = capital;

-- 12. Find the country where the capital is the country + 'City'
-- Answer is a modification of a pre-filled example
SELECT name FROM world
  WHERE capital LIKE concat(name, '% City');

-- 13. Find the capital and name where the capital includes the name of the country
SELECT capital, name FROM world
  WHERE capital LIKE CONCAT('%', name, '%');

-- 14. Find the capital and name where the capital is an extension of the country name
SELECT capital, name FROM world
  WHERE capital LIKE CONCAT('%', name, '%')
  AND capital != name;

-- 15. Show the name and extension where the capital is an extension of the country name
SELECT name, REPLACE(capital, name, '') FROM world
  WHERE capital LIKE CONCAT('%', name, '%')
  AND capital != name;
