DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Cat;
DROP TABLE IF EXISTS Adoption;
DROP TABLE IF EXISTS Shelter;

CREATE TABLE User (
  username VARCHAR(100) PRIMARY KEY,
  name VARCHAR(100),
  address VARCHAR(1000),
  postcode VARCHAR(100),
  email VARCHAR (100)
);

CREATE TABLE Cat(
  catid INTEGER PRIMARY KEY,
  name VARCHAR(100),
  shelter VARCHAR(100),
  FOREIGN KEY (shelter) REFERENCES Shelter(shelterName)
);

CREATE TABLE Adoption(
  user VARCHAR (100),
  catid INTEGER,
  adoptionDate DATE NULL,
  PRIMARY KEY (user, catid)
);

CREATE TABLE Shelter(
  shelterName VARCHAR (100) PRIMARY KEY,
  address VARCHAR (1000),
  region VARCHAR (100),
  phone INTEGER,
  email VARCHAR(100)
)
