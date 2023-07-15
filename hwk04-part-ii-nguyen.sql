
CREATE DATABASE moviedbnew;
DROP DATABASE moviedbnew;
USE moviedbnew;

DROP TABLE IF EXISTS Movie;
DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Reviewer;
DROP TABLE IF EXISTS Rating;

CREATE TABLE Movie (
    mID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    UNIQUE (title, release_date),
    title VARCHAR(100) NOT NULL,
    release_date DATE NOT NULL,
    FOREIGN KEY (director)
        REFERENCES reviewer (pID),
    director INT NOT NULL
);

CREATE TABLE Person (
    pID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    lives_in VARCHAR(100) NOT NULL
);

CREATE TABLE Reviewer (
    r_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    reviewer INT NOT NULL,
    worked_for VARCHAR(100),
    FOREIGN KEY (reviewer)
        REFERENCES Person (pID)
);

CREATE TABLE Rating (
    rID INT,
    mID INT,
    stars INT NOT NULL,
    rating_date DATETIME PRIMARY KEY,
    FOREIGN KEY (rID)
        REFERENCES reviewer (rID),
    FOREIGN KEY (mID)
        REFERENCES Movie (mID)
);


# TEST DATA -- 

/* Data for Person table */
INSERT INTO Person (first_name, last_name, lives_in) VALUES('Victor' , 'Fleming', 'NY');
INSERT INTO Person (first_name, last_name, lives_in) VALUES('George' , 'Lucas', 'LA');
INSERT INTO Person (first_name, last_name, lives_in) VALUES('James' , 'Cameron', 'LA');
INSERT INTO Person (first_name, last_name, lives_in) VALUES('Pete' , 'Doctor', 'NY');
INSERT INTO Person (first_name, last_name, lives_in) VALUES('Mike' , 'Anderson', 'NY');
INSERT INTO Person (first_name, last_name, lives_in) VALUES('David' , 'Ansen', 'LA');
INSERT INTO Person (first_name, last_name, lives_in) VALUES('Seth' , 'Rogen', 'NY');

/* Data for Movie table */
INSERT INTO Movie (title, release_date, director) VALUES ('Gone with the Wind', '1939/01/01', 1);
INSERT INTO Movie (title, release_date, director) VALUES('Star Wars', '1977/01/01', 2);
INSERT INTO Movie (title, release_date, director) VALUES('Avatar', '2009/12/18', 3);


/* Data for Reviewer table */

INSERT INTO Reviewer (reviewer, worked_for) VALUES (5, 'New York Times');
INSERT INTO Reviewer (reviewer, worked_for) VALUES (6, 'Washington Post');
INSERT INTO Reviewer (reviewer, worked_for) VALUES (7, 'Hollywood Reporter');

/* Data for Rating table */

INSERT INTO Rating (rID, mID, stars, rating_date) VALUES (5, 1, 3, '1978/02/02');
INSERT INTO Rating (rID, mID, stars, rating_date) VALUES (6, 2, 3, '1976/12/12');

SELECT * FROM Person;
SELECT * FROM Movie;
SELECT * FROM Reviewer;
SELECT * FROM Rating;

/* Question 1 */

INSERT INTO Movie(title, release_date, director) VALUES('Up', '2009/05/29', 4);

/* Question 2 */

UPDATE Movie
SET mID = 109
WHERE title = 'Up';

/* Question 3 */

INSERT INTO Rating(mID)
SELECT mID
FROM Movie WHERE director = 'James Cameron';
INSERT INTO Rating(rID,Stars, rating_date)
VALUES (ROW_NUMBER(),5, curdate());

/* Question 4 */

UPDATE Ratings
SET Stars = 5, Rating_date=curdate()
WHERE mID = (SELECT mID FROM Movie WHERE title) = 'Gone with the wind' AND director='Mike Aderson';

/* Question 5 */

DELETE FROM Rating WHERE mID = (SELECT mID FROM Movie WHERE release_date >= 2000 AND release_date <= 1970);