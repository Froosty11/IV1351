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
    TO_CHAR(date_and_time, 'MONTH') as "MONTH",
    COUNT(single_p_lesson) as "S_LESSON",
    COUNT(ensemble) as "ENSEMBLE",
    COUNT(group_lesson) as "G_LESSON"
FROM
    lesson, single_p_lesson, ensemble, group_lesson
WHERE date_and_time between 'January 1, 2022' and 'December 31, 2022'
GROUP BY TO_CHAR(date_and_time, 'MONTH');