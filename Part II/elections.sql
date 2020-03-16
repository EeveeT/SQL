-- The comment lines starting -- ! are used by the automatic testing tool to
-- help mark your coursework. You must not modify them or add further lines
-- starting with -- !. Of course you can create comments of your own, just use
-- the normal -- to start them.

-- !elections

-- !question0
-- This is an example question and answer.

SELECT Party.name FROM Party 
JOIN Candidate ON Candidate.party = Party.id 
WHERE Candidate.name = 'Mark Bradshaw';

-- !question1

SELECT Party.name FROM Party ORDER BY Party.name;

-- !question2

SELECT SUM(Candidate.votes) AS bristol_votes FROM Candidate;

-- !question3
SELECT Candidate.name, Candidate.votes FROM Candidate
INNER JOIN Ward ON Candidate.ward = Ward.id 
WHERE Ward.name = 'Bedminster'
-- !question4

SELECT SUM(Candidate.votes) FROM Candidate
INNER JOIN Party ON Candidate.party = Party.id
INNER JOIN Ward ON Candidate.ward = Ward.id
WHERE Party.name = 'Liberal Democrat' AND Ward.name = 'Filwood';

-- !question5

SELECT Candidate.name, Candidate.party, Candidate.votes FROM Candidate
INNER JOIN Ward on Candidate.ward = Ward.id
WHERE Ward.name = 'Hengrove' 
ORDER BY Candidate.votes DESC; 

-- !question6

WITH PartyVotes AS (
	SELECT Party.name AS party, Candidate.votes AS votes FROM Candidate
	INNER JOIN Party ON Party.id = Candidate.party
	INNER JOIN Ward ON Ward.id = Candidate.ward
	WHERE Ward.name = 'Bishopsworth'
)
SELECT COUNT(Votes.votes) AS Labour_Ranking FROM PartyVotes Votes, PartyVotes Labour
WHERE Labour.party = 'Labour' AND Votes.votes >= Labour.votes;

-- !question7
WITH Total_Votes AS (
	SELECT SUM(Candidate.votes) AS total_votes, Candidate.ward AS ward FROM Candidate
	GROUP BY Candidate.ward
),
Green_Votes AS (
	SELECT Candidate.votes AS votes, Candidate.ward AS ward FROM Candidate
	INNER JOIN Party ON Candidate.party = Party.id
	WHERE Party.name = 'Green'
) 
SELECT Ward.name, (votes/total_votes*100) AS percentage_green FROM Total_Votes 
INNER JOIN Green_Votes ON Total_Votes.ward = Green_Votes.ward
INNER JOIN Ward ON Total_Votes.ward = Ward.id;

-- !question8

WITH Green_Votes AS(
	SELECT Candidate.votes AS green_votes, Candidate.ward AS ward FROM Candidate
	INNER JOIN Party ON Candidate.party = Party.id
	WHERE Party.name = 'Green'
),
Labour_Votes AS(
	SELECT Candidate.votes AS labour_votes, Candidate.ward AS ward FROM Candidate
	INNER JOIN Party ON Candidate.party = Party.id
	WHERE Party.name = 'Labour'
)
SELECT Ward.name as ward, ((green_votes - labour_votes)/electorate*100) AS rel, (green_votes - labour_votes) AS abs FROM Ward
INNER JOIN Green_Votes ON Ward.id = Green_Votes.ward
INNER JOIN Labour_Votes ON Ward.id = Labour_Votes.ward
WHERE green_votes > labour_votes;

-- !end

