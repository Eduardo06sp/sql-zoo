-- 1. List teachers who have
--    NULL for their department
SELECT name
FROM teacher
WHERE dept IS NULL;

-- 2. Example demonstrating INNER JOIN
--    with NULL values

-- 3. Use a different JOIN so that
--    all teachers are listed
SELECT teacher.name, dept.name
FROM teacher
  LEFT JOIN dept ON teacher.dept = dept.id;

-- 4. Use a different JOIN so that
--    all departments are listed
SELECT teacher.name, dept.name
FROM teacher
  RIGHT JOIN dept ON dept.id = teacher.dept;

-- 5. Show teacher name and mobile number
--    or '07986 444 2266' if no number
--    Use COALESCE
SELECT teacher.name,
  COALESCE(teacher.mobile, '07986 444 2266')
FROM teacher;

-- 6. Print teacher name and department name
--    Replace empty departments with 'None'
--    Use COALESCE and LEFT JOIN
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher
  LEFT JOIN dept ON dept.id = teacher.dept;

-- 7. Show number of teachers and
--    number of mobile phones
--    Use COUNT
SELECT COUNT(teacher.id), COUNT(teacher.mobile)
FROM teacher;

-- 8. Show each department and number of staff
--    Use COUNT, GROUP BY, and RIGHT JOIN
SELECT dept.name, COUNT(teacher.dept)
FROM teacher
  RIGHT JOIN dept ON dept.id = teacher.dept
GROUP BY dept.name;

-- 9. Show each teacher name
--    follow with 'Sci' if their department is 1 or 2
--    follow with 'Art' otherwise
--    Use CASE
SELECT teacher.name,
  CASE WHEN dept = 1
       OR dept = 2
         THEN 'Sci'
         ELSE 'Art'
  END
FROM teacher;

-- 10. Show each teacher name
--    follow with 'Sci' if their department is 1 or 2
--    follow with 'Art' if department is 3
--    follow with 'None' otherwise
SELECT teacher.name,
  CASE WHEN dept = 1
       OR dept = 2
         THEN 'Sci'
       WHEN dept = 3
         THEN 'Art'
       ELSE
         'None'
       END
FROM teacher;
