-- 1. Show mtachid and player name
--    for all goals scored by Germany
-- Answer is a modification of a pre-filled example
SELECT matchid, player FROM goal
  WHERE teamid = 'GER'

-- 2. Show id, stadium, team1, team2 for game 1012
-- Answer is a modification of a pre-filled example
SELECT id,stadium,team1,team2
  FROM game
  WHERE game.id = 1012

-- 3. Show player, teamid, stadium and mdate
--    for every German goal
-- Answer is a modification of a pre-filled example
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
  WHERE teamid = 'GER'

-- 4. Show team1, team2 and player for every goal
--    scored by player called Mario
--    player LIKE 'Mario%'
SELECT team1, team2, player
FROM game
JOIN goal
ON game.id = goal.matchid
WHERE goal.player LIKE 'Mario%';

-- 5. Show player, teamid, coach and gtime for
--    all goals scored in the first 10 minutes
-- Answer is a modification of a pre-filled example
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON teamid = id
 WHERE gtime<=10

-- 6. List dates of matches and team name
--    in which 'Fernando Santos' was team1 coach
SELECT mdate, teamname
FROM game
JOIN eteam
ON eteam.id = game.team1
WHERE coach = 'Fernando Santos';

-- 7. List player for every goal scored in stadium
--    'National Stadium, Warsaw'
SELECT player
FROM goal
JOIN game
ON goal.matchid = game.id
WHERE stadium = 'National Stadium, Warsaw';

-- 8. Show name of all players who
--    scored against Germany
-- Answer is a modification of a pre-filled example

-- MAKE SURE THE PLAYER SCORING ISN'T GERMAN!
-- THEN FIND MATCHES INCLUDING GERMANY (TEAM1 OR TEAM2)
-- SELECT NON-GERMAN PLAYERS MAYBE?
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id
    WHERE (team1='GER' OR team2='GER')
    AND (goal.teamid != 'GER')

-- 9. Show teamname and the
--    total number of goals scored
-- Answer is a modification of a pre-filled example
SELECT teamname, COUNT(*) AS total_goals
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname

-- 10. Show stadium and number of goals
--     scored in each stadium
SELECT game.stadium,
  COUNT(goal.matchid) AS total_goals
FROM game
JOIN goal ON game.id = goal.matchid
GROUP BY game.stadium;

-- 11. For every match involving 'POL',
--     show matchid, date and number of goals scored
-- Answer is a modification of a pre-filled example
SELECT matchid,mdate, COUNT(matchid)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = 'POL' OR team2 = 'POL')
 GROUP BY matchid, mdate;

-- 12. For every match where 'GER' scored,
--     show matchid, match date and goals 'GER' scored
SELECT goal.matchid,
  game.mdate,
  COUNT(goal.matchid) AS germany_goals
FROM game
JOIN goal ON game.id = goal.matchid
WHERE (team1 = 'GER' OR team2 = 'GER')
AND (teamid = 'GER')
GROUP BY goal.matchid, game.mdate;

-- 13. List every match with the score results
--     Use "CASE WHEN"
--     Sort by mdate, matchid, team1 and team2
-- Answer is a modification of a pre-filled example
SELECT
  mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
FROM game LEFT JOIN goal ON matchid = id
GROUP BY id, mdate, team1, team2
ORDER BY mdate, matchid, team1, team2;
-- For this last answer,
-- although the lessons haven't gone through LEFT JOINS
-- it seemed to be an appropriate place to use it
