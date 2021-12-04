-- 1. Example demonstrating table data

-- 2. Give year of 'Citizen Kane'
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

-- 3. List Star Trek movies
--    Include id, title and yr
--    Order by year
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

-- 4. What id # does actor
--    'Glenn Close' have?
SELECT id
FROM actor
WHERE name = 'Glenn Close';

-- 5. What is id of film 'Casablanca'
SELECT id
FROM movie
WHERE title = 'Casablanca';

-- 6. Obtain cast list for 'Casablanca'
--    Use previous answer as movieid
SELECT actor.name
FROM casting
JOIN actor
ON casting.actorid = actor.id
WHERE movieid = 11768;

-- 7. Obtain cast list for 'Alien'
SELECT actor.name
FROM casting
JOIN actor
ON casting.actorid = actor.id
WHERE casting.movieid = (
  SELECT id
  FROM movie
  WHERE title = 'Alien');

-- 8. List films with 'Harrison Ford' appearance
SELECT movie.title
FROM movie
INNER JOIN casting
ON movie.id = casting.movieid
INNER JOIN actor
ON actor.id = casting.actorid
WHERE actor.name = 'Harrison Ford';

-- 9. List films with 'Harrison Ford' appearance
--    but not in starring role
SELECT movie.title
FROM movie
INNER JOIN casting
ON movie.id = casting.movieid
INNER JOIN actor
ON actor.id = casting.actorid
WHERE actor.name = 'Harrison Ford'
AND casting.ord != 1;

-- 10. List leading stars for 1962 films
SELECT movie.title, actor.name
FROM movie
INNER JOIN casting
ON movie.id = casting.movieid
INNER JOIN actor
ON actor.id = casting.actorid
WHERE movie.yr = 1962
AND casting.ord = 1;

-- 11. Show busiest years for 'Rock Hudson'
--     Show year and number of movies made where
--     he made more than 2 movies
-- Answer is a modification of a pre-filled example
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12. List movie title and leading actor
--     for movies 'Julie Andrews' played in
-- Answer is a modification of a pre-filled example
SELECT movie.title, actor.name
FROM movie
  INNER JOIN casting ON movie.id = casting.movieid
  INNER JOIN actor ON actor.id = casting.actorid
WHERE movie.id IN (
  SELECT movieid FROM casting
  WHERE actorid IN (
    SELECT id FROM actor
    WHERE name='Julie Andrews')
  )
AND casting.ord = 1;

-- 13. List actors with at least 15 starring roles
--     Order alphabetically
SELECT actor.name
FROM actor
  JOIN casting ON actor.id = casting.actorid
AND casting.ord = 1
GROUP BY name
HAVING COUNT(ord) >= 15
ORDER BY name;

-- 14. List 1978 films
--     ordered by number of actors (in the cast),
--     then by title
SELECT movie.title, COUNT(casting.actorid)
FROM movie
  JOIN casting ON casting.movieid = movie.id
  JOIN actor ON casting.actorid = actor.id
WHERE yr = 1978
GROUP BY movie.title
ORDER BY COUNT(casting.actorid) DESC, title;

-- 15. List all people who have worked
--     with 'Art Garfunkel'
SELECT actor.name
FROM actor
  JOIN casting ON actor.id = casting.actorid
  JOIN movie ON movie.id = casting.movieid
WHERE movieid IN (
  SELECT casting.movieid
  FROM casting
    JOIN actor ON actor.id = casting.actorid
    WHERE actor.name = 'Art Garfunkel')
AND actor.name != 'Art Garfunkel';
