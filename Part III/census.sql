-- This file is for your solutions to the census question.
-- Lines starting with -- ! are recognised by a script that we will
-- use to automatically test your queries, so you must not change
-- these lines or create any new lines starting with this marker.
--
-- You may break your queries over several lines, include empty
-- lines and SQL comments wherever you wish.
--
-- Remember that the answer to each question goes after the -- !
-- marker for it and that the answer to each question must be
-- a single SQL query.
--
-- Upload this file to SAFE as part of your coursework.

-- !census

-- !question0

-- Sample solution to question 0.
SELECT data FROM Statistic WHERE wardId = 'E05001982' AND
occId = 2 AND gender = 0;

-- !question1

SELECT data FROM Statistic WHERE wardId = 'E05001975' AND occID = 7 AND gender = 1;

-- !question2
SELECT SUM(data) FROM Statistic WHERE wardId = 'E05000697' AND occID = 5;

-- !question3§

SELECT SUM(data) AS num_people, Occupation.name AS occ_class FROM Statistic 
INNER JOIN Occupation ON Statistic.occID = Occupation.id
WHERE wardId = 'E05008884'
GROUP BY Occupation.id;


-- !question4

SELECT SUM(data) AS 'Working Population', Ward.code AS 'Ward Code', Ward.name AS "Ward Name", County.name AS County 
FROM County
INNER JOIN Ward ON County.code = Ward.parent 
INNER JOIN Statistic ON Ward.code = Statistic.wardId
INNER JOIN Occupation ON Statistic.occID = Occupation.id
GROUP BY Ward.code
ORDER BY SUM(data) ASC LIMIT 1;

-- !question5
WITH Working_Population AS(
	SELECT SUM(Statistic.data) AS working_population, Ward.name AS ward_name FROM Statistic
	INNER JOIN Ward ON Statistic.wardId = Ward.Code
	GROUP BY wardId
)
SELECT COUNT(ward_name) FROM Working_Population
WHERE working_population >= 1000;


-- !question6
WITH Working_Population AS(
	SELECT SUM(Statistic.data) AS working_population, Ward.parent AS county FROM Statistic
	INNER JOIN Ward ON Statistic.wardId = Ward.Code
	GROUP BY wardId
)
SELECT Region.name AS name, AVG(working_population) AS avg_size FROM Working_Population
INNER JOIN County ON County.code = county
INNER JOIN Region ON Region.code = County.parent
GROUP BY Region.code
ORDER BY Region.name;


-- Place your answer to question 6 here. Delete this comment.

WITH North_West_Data AS(
	SELECT County.name AS CLU, Occupation.name AS occupation, Statistic.gender AS gender, SUM(Statistic.data) AS N 
	FROM County
	INNER JOIN Region ON Region.code = County.parent
	INNER JOIN Ward ON County.code = Ward.parent
	INNER JOIN Statistic ON Ward.code = Statistic.wardId
	INNER JOIN Occupation ON Statistic.occId = Occupation.id
	WHERE Region.code = 'E12000002'
	GROUP BY County.name, Occupation.name, Statistic.gender
)
SELECT CLU, occupation, gender, N,
CASE 
	WHEN North_West_Data.gender = 0 THEN 'female'
	WHEN North_West_Data.gender = 1 THEN 'male'
	ELSE 'INVALID'
END AS gender, North_West_Data.N AS N FROM North_West_Data
WHERE North_West_Data.N >= 10000
ORDER BY North_West_Data.N ASC;
-- Place your answer to question 7 here. Delete this comment.

-- !question8

-- Place your answer to question 8 here. Delete this comment.

-- !question9

-- Place your answer to question 9 here. Delete this comment.

-- !end











SELECT SUM(Statistic.data) AS total_working_pop, Statistic.gender AS gender 
FROM Statistic
GROUP BY Statistic.gender






