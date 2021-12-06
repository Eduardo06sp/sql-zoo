-- Please note: All the exercises in this set provided
--              hints/examples

-- 1. Show lastName, party and votes for constituency
--    'S14000024' in 2017
SELECT lastName, party, votes
  FROM ge
 WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY votes DESC;

-- 2. Show party and RANK for constituency
--    S14000024 in 2017
--    List by party

SELECT party, votes, RANK() OVER (ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency = 'S14000024' AND yr = 2017
 ORDER BY party;

-- 3. Example demonstrating use of PARTITION

-- 4. Show ranking of each party in Edinburgh in 2017
--    Order by winners first, then constituency
SELECT constituency,party, votes,
  RANK() OVER (
    PARTITION BY constituency ORDER BY votes DESC
  ) as posn
  FROM ge
 WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
   AND yr  = 2017
ORDER BY posn, constituency;

-- 5. Show parties that won for each 2017
--    Edinburgh constituency

-- FLAG FOR LATER

-- 6. Show how many seats for each
--    2017 Scotland party

-- FLAG FOR LATER
