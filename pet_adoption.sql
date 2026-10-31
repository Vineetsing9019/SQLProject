-- Pet Adoption Management System (MySQL)
-- Every query from PetFinalMySQL.pdf, in order. Run the whole file in MySQL Workbench or the mysql client.

-- 1. Database
CREATE DATABASE Finalpro;
USE Finalpro;

-- 2. Tables
CREATE TABLE Pets
(
    PetID INT PRIMARY KEY,
    PetName VARCHAR(30) NOT NULL,
    PetType VARCHAR(30) NOT NULL,
    Age INT CHECK(Age>0)
);
DESC Pets;

CREATE TABLE Adopters
(
    AdopterID INT PRIMARY KEY,
    AdopterName VARCHAR(30) NOT NULL,
    Email VARCHAR(50) UNIQUE,
    City VARCHAR(30) NOT NULL
);
DESC Adopters;

CREATE TABLE Adoption
(
    AdoptionID INT PRIMARY KEY,
    PetID INT,
    AdopterID INT,
    AdoptionDate DATE NOT NULL,

    FOREIGN KEY(PetID) REFERENCES Pets(PetID),
    FOREIGN KEY(AdopterID) REFERENCES Adopters(AdopterID)
);
DESC Adoption;

-- 3. Data
INSERT INTO Pets
VALUES
(101,'Buddy','Golden Retriever',2),
(102,'Luna','Persian Cat',1),
(103,'Rocky','Labrador Puppy',3),
(104,'Bella','Indian Dog',2),
(105,'Mithu','Parrot',1),
(106,'Snow','Rabbit',1),
(107,'Max','German Shepherd',4),
(108,'Daisy','Pomeranian',2),
(109,'Coco','Persian Cat',3),
(110,'Tiger','Indian Dog',5);
SELECT * FROM Pets;

INSERT INTO Adopters
VALUES
(201,'Vineet','vineet@gmail.com','Badlapur'),
(202,'Rahul','rahul@gmail.com','Mumbai'),
(203,'Sneha','sneha@gmail.com','Thane'),
(204,'Amit','amit@gmail.com','Pune'),
(205,'Neha','neha@gmail.com','Kalyan'),
(206,'Riya','riya@gmail.com','Dombivli'),
(207,'Karan','karan@gmail.com','Nashik'),
(208,'Priya','priya@gmail.com','Panvel'),
(209,'Arjun','arjun@gmail.com','Ulhasnagar'),
(210,'Pooja','pooja@gmail.com','Ambernath');
SELECT * FROM Adopters;

INSERT INTO Adoption
VALUES
(301,101,201,'2026-05-18'),
(302,102,202,'2026-05-27'),
(303,103,203,'2026-06-08'),
(304,104,204,'2026-06-19'),
(305,105,205,'2026-06-29'),
(306,106,206,'2026-07-06'),
(307,107,207,'2026-07-08'),
(308,108,208,'2026-07-12'),
(309,109,209,'2026-07-15'),
(310,110,210,'2026-07-20');
SELECT * FROM Adoption;

-- 4. Filtering
-- Pets by age
SELECT * FROM Pets
WHERE Age=2;

-- Pets by age and type
SELECT * FROM Pets
WHERE Age>=2 AND PetType='Indian Dog';

-- Adopters by city
SELECT * FROM Adopters
WHERE City='Mumbai' OR City='Pune';

-- Adopters whose name starts with P
SELECT * FROM Adopters
WHERE AdopterName LIKE 'P%';

-- Pets between two ages
SELECT * FROM Pets
WHERE Age BETWEEN 2 AND 4;

-- Adopters from particular cities
SELECT * FROM Adopters
WHERE City IN ('Mumbai','Pune','Thane');

-- 5. Sorting and unique values
SELECT * FROM Pets
ORDER BY Age;

SELECT * FROM Pets
ORDER BY Age DESC;

SELECT DISTINCT PetType
FROM Pets;

-- 6. Aggregate functions
SELECT COUNT(*) AS TotalPets
FROM Pets;

SELECT MAX(Age)
FROM Pets;

SELECT MIN(Age)
FROM Pets;

SELECT AVG(Age)
FROM Pets;

-- 7. Update, insert and delete
UPDATE Pets
SET Age=3
WHERE PetID=102;
SELECT * FROM Pets;

INSERT INTO Pets
VALUES (111,'Bruno','Beagle',2);
SELECT * FROM Pets;

DELETE FROM Pets
WHERE PetID = 111;
SELECT * FROM Pets;

-- 8. Changing the table (ALTER)
ALTER TABLE Pets
ADD Gender VARCHAR(10);
DESC Pets;

UPDATE Pets
SET Gender='Male'
WHERE PetID=101;
SELECT * FROM Pets;

ALTER TABLE Pets
MODIFY Gender VARCHAR(20);
DESC Pets;

ALTER TABLE Pets
DROP COLUMN Gender;
DESC Pets;

-- 9. Joins
-- Inner join: which pet went to which adopter, and when
SELECT
Pets.PetName,
Adopters.AdopterName,
Adoption.AdoptionDate
FROM Adoption
INNER JOIN Pets
ON Adoption.PetID=Pets.PetID
INNER JOIN Adopters
ON Adoption.AdopterID=Adopters.AdopterID;

-- Left join: every pet, with its adopter if it has one
SELECT
Pets.PetName,
Adopters.AdopterName
FROM Pets
LEFT JOIN Adoption
ON Pets.PetID=Adoption.PetID
LEFT JOIN Adopters
ON Adoption.AdopterID=Adopters.AdopterID;

-- Right join: every adopter, with the pet they adopted
SELECT
Pets.PetName,
Adopters.AdopterName
FROM Pets
RIGHT JOIN Adoption
ON Pets.PetID=Adoption.PetID
RIGHT JOIN Adopters
ON Adoption.AdopterID=Adopters.AdopterID;
