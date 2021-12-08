-- 1. Show number of stops
SELECT COUNT(*)
FROM stops;

-- 2. Find id for the stop 'Craiglockhart'
SELECT id
FROM stops
WHERE name LIKE 'Craiglockhart';

-- 3. Find id and name for stops on the 4 LRT service
SELECT id, name
FROM route
  JOIN stops
  ON stops.id = route.stop
WHERE num = '4'
AND company = 'LRT';

-- 4. Add a HAVING caluse to restrict output
--    to the two services that link
--    London Road (149) and Craiglockhart (53)
-- Answer is a modification of a pre-filled example
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;

-- 5. Show services from Craiglockhart to London
-- Answer is a modification of a pre-filled example
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53
AND b.stop=149;

-- 6. Show services between 'Craiglockhart' and
--    'London Road'
-- Answer is a modification of a pre-filled example
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name='London Road';

-- 7. Give a list of all the services which connect
--    stops 115 and 137 ('Haymarket' and 'Leith')
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115
AND b.stop=137;

-- 8. List services that connect the stops
--    'Craiglockhart' and 'Tollcross'
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name='Tollcross';

-- 9. List distinct stops which may be reached from
--    'Craiglockhart' by taking one bus (including
--    Craiglockhart) offered by the LRT company
--    Include company and bus number
SELECT stopb.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND a.company = 'LRT';

-- 10. Find routes involving two buses that can go
--     from Craiglockhart to Lochend
--     Show bus no. and company for first bus,
--     the name of the stop for the transfer,
--     then bus no. and company for second bus
SELECT a.num, a.company, stopb.name, c.num, c.company
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
JOIN route c ON
  (b.stop = c.stop)
JOIN route d ON
  (d.company=c.company AND d.num=c.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
  JOIN stops stopc ON (c.stop=stopc.id)
  JOIN stops stopd ON (d.stop=stopd.id)
WHERE stopa.name='Craiglockhart'
AND stopd.name='Lochend';
-- ORDER BY a.num, stopb.name, d.num (credit: fish-404, see below)

-- Credit to StackOverflow user fish-404 for providing
-- a very similar solution that helped me answer this problem!
