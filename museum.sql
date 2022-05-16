CREATE TABLE Artifacts(
	ID              INT PRIMARY KEY, #we chose to make every id in this database an int, varchar would also be an option 
	title           VARCHAR(30) NOT NULL, #every artifact has a title
	description     TEXT UNIQUE, #the description of an artifact is specifically designed for the piece
	value           INT,
	year            INT, #not a whole date
	artistID        VARCHAR(15) NOT NULL, #we assume that we know who made an artifact, so the artistID shouldn be NULL
	collectionTitle VARCHAR(30) NOT NULL,
	collectionDate  DATE
);

CREATE TABLE Paintings(
	ID              INT PRIMARY KEY,
	canvas          VARCHAR(10)
);


CREATE TABLE Sculptures(
	ID              INT PRIMARY KEY,
	material        VARCHAR(20),
	color           VARCHAR(20)
);

CREATE TABLE Artists(
	ID              INT PRIMARY KEY,
	name            VARCHAR(20) NOT NULL,
	birthDate       DATE,
	deathDate       DATE,
	bio             TEXT UNIQUE, #same as description
);

CREATE TABLE Collections(
	title           VARCHAR(30) PRIMARY KEY,
	topic           VARCHAR(30)
);

CREATE TABLE Exhibitions(
	title           VARCHAR(30) PRIMARY KEY,
	topic           VARCHAR(30) NOT NULL, #every exhibition should contain a topic
	room            INT, #room is not unique because we track all events, so exhibitions can be held in the same room at different times
	startDate       DATE,
	endDate         DATE
);

CREATE TABLE Advertisements(
	exhibitionsTitle VARCHAR(30),
	date            DATE,
	mediumName      VARCHAR(20),
	cost            DECIMAL,
	duration        INT,   #Duration in days
    PRIMARY KEY(exhibitionsTitle, date, mediumName)
);

CREATE TABLE Media(
	name            VARCHAR(30) PRIMARY KEY,
	type            VARCHAR(30)
);

CREATE TABLE InfluencedBy(
	influenceeID    INT NOT NULL,
	influencerID    INT NOT NULL,
    PRIMARY KEY(influenceeID, influencerID)
);

CREATE TABLE ExhibitedAt(
	artifcatID      INT,
	exhibitionTitle VARCHAR(30),
    PRIMARY KEY(artifcatID, exhibitionTitle)
);

#Exercise 2
#1
SELECT value, title
FROM artifacts
WHERE value >= 100000
ORDER BY value

#2
SELECT DISTINCT collectionTitle 
FROM artifacts
WHERE title LIKE '%sun%';

#3
SELECT COUNT(exhibitionTitle) 
FROM advertisements
WHERE exhibitionTitle = "Dutch painters" AND mediumName = "Daily Planet";


#4
SELECT ID, COUNT(influenceeID)
FROM artists
WHERE influenceeID > 10;

#5
SELECT mediumName, AVG(cost) as average_pay
FROM media
GROUP BY mediumName;

#6
SELECT title, topic
FROM exhibitions
WHERE startDate <= 2017-06-01 AND endDate >= 2017-12-31;




