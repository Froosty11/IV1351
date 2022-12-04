--######################################################################################
--Assignment 1: 
--Show the number of lessons given per month during a specified year. This query is expected to be performed a few times per week. 
--It shall be possible to retrieve the total number of lessons per month (just one number per month) and the specific number of 
--individual lessons, group lessons and ensembles (three numbers per month). It's not required that all four numbers (total plus one
--per lesson type) for a particular month are on the same row; you're allowed to have one row for each number as long as it's clear 
--to which month each number belongs. However, it's most likely easier to understand the result if you do place all numbers for a 
--particular month on the same row, and it's an interesting exercise, therefore you're encouraged to try.

--SCRIPT 1
-- SHOW NUMBER OF TOTAL LESSONS OF ALL TYPES PER MONTH
SELECT 
    TO_CHAR(date_and_time, 'MONTH') as "Month",
    COUNT(lesson)
FROM
    lesson
WHERE date_and_time between 'January 1, 2022' and 'December 31, 2022'
GROUP BY TO_CHAR(date_and_time, 'MONTH');

--SCRIPT 2
--SHOW NUMBER OF LESSONS OF EACH TYPE PER MONTH
SELECT 
    TO_CHAR(c.date_and_time, 'MONTH') as "MONTH",
    SUM(CASE WHEN c.type = 'single_p_lesson'  then 1 else 0 end) as "S_LESSON",
    SUM(CASE WHEN c.type = 'ensemble' then 1 else 0 end) as "ENSEMBLE",
    SUM(CASE WHEN c.type = 'group_lesson' then 1 else 0 end) as "G_LESSON"
FROM
    lesson AS c, pg_class p
WHERE 
    c.date_and_time between 'January 1, 2022' and 'December 31, 2022' AND c.tableoid = p.oid
GROUP BY 
    TO_CHAR(c.date_and_time, 'MONTH');

--######################################################################################
--Assignment 3:
--List all instructors who has given more than a specific number of lessons during the current month. 
--Sum all lessons, independent of type, and sort the result by the number of given lessons.
--This query will be used to find instructors risking to work too much, and will be executed daily.
SELECT 
    full_name AS "NAME",
    SUM(CASE WHEN l.instructorID = i.id then 1 else 0 end) AS "LESSONS"
FROM 
    instructor AS i, lesson AS l
WHERE
    l.date_and_time BETWEEN 'December 1, 2022' AND  'December 31, 2022'
GROUP BY 
    i.full_name
ORDER BY 
    "LESSONS" DESC


