-- Please note: All the exercises in this set provided
--              hints/examples

-- 1. Show percentage who STRONGLY AGREE
SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science';

-- 2. Show institution and subject
--    where score is at least 100 for question 15
SELECT institution, subject
  FROM nss
 WHERE question='Q15'
 AND score>=100;

-- 3. Show institution and score
--    where '(8) Computer Science' is
--    less than 50 for question 15
SELECT institution,score
  FROM nss
 WHERE question='Q15'
 AND subject='(8) Computer Science'
 AND score<50;

-- 4. Show subject and total number of students
--    who responded to question 22 for each of the subjects
--    '(8) Computer Science' and
--    '(H) Creative Arts and Design'
SELECT subject, SUM(response)
  FROM nss
 WHERE (
   question='Q22'
   AND subject='(8) Computer Science')
   OR  (
   question='Q22'
   AND subject='(H) Creative Arts and Design')
 GROUP BY subject;

-- 5. Show subject and total number of students who
--    A_STRONGLY_AGREE to question 22 for each of
--    the subjects '(8) Computer Science)' and
--    '(H) Creative Arts and Design'
SELECT subject,SUM(A_STRONGLY_AGREE * .01 * response)
  FROM nss
 WHERE (
   question='Q22'
   AND subject='(8) Computer Science')
   OR (
   question='Q22'
   AND subject='(H) Creative Arts and Design')
 GROUP BY subject;

-- 6. Show percentage of students who
--    A_STRONGLY_AGREE to question 22
--    for subject '(8) Computer Science'
--    Do the same thing for '(H) Creative Arts and Design'
--    Use ROUND to remove any decimal places
SELECT subject,
  ROUND(
    SUM(response * A_STRONGLY_AGREE) / SUM(response),
  0)
FROM nss
 WHERE (
   question='Q22'
   AND subject IN (
     '(8) Computer Science',
     '(H) Creative Arts and Design'))
GROUP BY subject;

-- 7. Show average scores for question 22
--    for each institution that includes
--    'Manchester' in the name
SELECT institution,
  ROUND(
    AVG(score * response) / AVG(response),
  0)
  FROM nss
 WHERE question='Q22'
   AND (institution LIKE '%Manchester%')
GROUP BY institution
ORDER BY institution;

-- 8. Show institution, total sample size and
--    number of computing students for Manchester
--    institutions for 'Q01'

-- FLAG FOR LATER
