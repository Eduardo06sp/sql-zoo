-- 1. Show 1950 Nobel prizes
-- Answer is a modification of a pre-filled example
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;

-- 2. Show 1962 Literature prize winner
-- Answer is a modification of a pre-filled example
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';

-- 3. Show the year and subject that won 'Albert Einstein' his prize
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

-- 4. Give name of 'Peace' winners since the year 2000 (including 2000)
SELECT winner
FROM nobel
WHERE subject = 'Peace'
AND yr >= 2000;

-- 5. Show all columns of Literature prize winners for 1980 to 1989 (inclusive)
SELECT *
FROM nobel
WHERE subject = 'Literature'
AND yr BETWEEN 1980 AND 1989;

-- 6. Show all columns of presidential winners:
--    Theodore Roosevelt
--    Woodrow Wilson
--    Jimmy Carter
--    Barack Obama
-- Answer is a modification of a pre-filled example
SELECT * FROM nobel
WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama');

-- 7. Show winners with first name John
SELECT winner
FROM nobel
WHERE winner LIKE 'John%';

-- 8. Show year, subject and name of 1980 Physics winners + 1984 Chemistry winners
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Physics' AND yr = 1980)
OR (subject = 'Chemistry' AND yr = 1984);

-- 9. Show year, subject and name of 1980 winners (excluding Chemistry and Medicine)
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980
AND subject NOT IN ('Chemistry', 'Medicine');

-- 10. Show year, subject and name of people who won a 'Medicine' prize
--     in an early year (before 1910)
--     together with 'Literature' prize winners
--     in a later year (after 2003)
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910)
OR (subject = 'Literature' AND yr > 2003);

-- 11. Find details of prize won by PETER GRÜNBERG
SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG';

-- 12. Find details of prize won by EUGENE O'NEILL
SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL';

-- 13. List winners, year and subject of winners starting with Sir
--     Show most recent first, then by name order
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner;

-- 14. Show 1984 winners and subject
--     ordered by subject and winner name;
--     but list Chemistry and Physics last
-- Answer is a modification of a pre-filled example
SELECT winner, subject
 FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject, winner;
