--  \i 'C:/Users/edvin/Documents/Data course/Seminar2/Create-Database.sql'
--  \i 'C:/Users/edvin/Documents/Data course/Seminar2/Fill-Database.sql'

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
--Assignment 2:
--Show how many students there are with no sibling, with one sibling, with two siblings, etc. 
--This query is expected to be performed a few times per week. The database must contain students 
--with no sibling, one sibling and two siblings, but doesn't have to contain students with more than 
--two siblings. Note that it's not allowed to solve this by just adding a column with sibling count 
--(maybe called siblings or something similar) to the student table. Such a solution would be 
--almost impossible to maintain since it doesn't tell who's a sibling of who. If a student quits, 
--there wont be any way to update the sibling count of that student's siblings.

SELECT siblings, COUNT(*) AS students
FROM (SELECT student.id, COALESCE(sibling_table.siblings, 0) AS siblings
      FROM student FULL JOIN
           (SELECT student.id, COUNT(*) AS siblings
            FROM student, sibling_info
            WHERE student.id = sibling_info.sibling1 OR student.id = sibling_info.sibling2
            GROUP BY student.id
            ORDER BY student.id) AS sibling_table
           ON student.id = sibling_table.id
      ORDER BY student.id) AS subquery
GROUP BY siblings
ORDER BY siblings DESC;

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
-- Assignment 4: 
--List all ensembles held during the next week, sorted by music genre and weekday.
-- For each ensemble tell whether it's full booked, has 1-2 seats left or has more seats left.
-- Hint: you might want to use a CASE statement in your query to produce the desired output.

SELECT
    e.spots_left AS "SPOTS LEFT",
    e.genre AS "GENRE"
FROM
    ensemble e
WHERE
    e.date_and_time BETWEEN CURRENT_TIMESTAMP AND CURRENT_TIMESTAMP + INTERVAL '7 day'
ORDER BY
    "GENRE" DESC,
    "SPOTS LEFT" DESC





--seminar 4
SELECT
    item.brand as "BRAND",
    item.price as "FEE"
FROM
    intstrumentItem item
WHERE
    ((item.lease_id is null) AND item.instrumentType = ?) 


--sem 4.2
SELECT * FROM lease WHERE lease_id = 3 FOR UPDATE;
UPDATE lease 
SET 
    startTime = CURRENT_TIMESTAMP, 
    endTime = CURRENT_TIMESTAMP + INTERVAL '1 year'
WHERE lease_id = 3;

select * from intstrumentItem where lease_id = 3
update lease


INSERT INTO intstrumentItem(?, 
    SELECT lease.id
        FROM lease
        WHERE ? = lease.id)

    INSERT INTO lease (startTime,endTime,id) 
        VALUES(CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL'1 year', 6);
        UPDATE intstrumentItem 
    SET lease_id = lease.id
    FROM lease
    WHERE lease.id = 6 AND serial_number = 'DAH' AND intstrumentItem.lease_id is null

-- sem 4.2 count amount of leases for a student
    select count(CASE WHEN 3 = lease.id THEN 1 END) from lease

--sem 4.3 disconnect a student and instrument from lease. 
INSERT INTO intstrumentItem(lease_id) VALUES(null) FROM lease WHERE lease_id = ?;
INSERT INTO lease(endTime, terminated, id) VALUES(CURRENT_TIMESTAMP, true, null) FROM lease WHERE lease_id = ?;

UPDATE intstrumentItem SET lease_id = null WHERE lease_id = ?;
UPDATE lease SET id = null, terminated = true FROM lease WHERE lease_id = ?;


