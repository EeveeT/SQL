

SELECT Shelter.name AS shelter FROM Shelter
INNER JOIN Cat ON Shelter.name = Cat.shelter
WHERE Shelter.region = 'South West' AND Cat.age > 3 AND Cat.sex = 1;

--An example of an member of staff for the Cat Adoption Shelter Agency
-- working out which region of England has the highest averge capacity
-- if this there is a connection to volume of users per region and capacity
-- in shelters in that region.

SELECT Shelter.name AS name, Shelter.region AS region, Shelter.capacity AS capacity, COUNT(User.region) AS num_users
FROM Shelter
INNER JOIN User ON Shelter.region = User.region

GROUP BY(?)

name            region         capacity          num_users
farm shelter     south west    42                12
shelter 2        south west    7                 12



WITH Adopts AS(
  SELECT COUNT(Cat.shelter) AS num, Shelter.name AS shelter FROM Cat
  INNER JOIN Adoption ON Adoption.catid = Cat.catid
  INNER JOIN Shelter ON Shelter.name = Cat.shelter
)
SELECT shelter FROM Adopts
WHERE num > 5000;
