--What is SQL?
/*SQL (Structured Query Language) is a programming language used to work with Database Management Systems (DBMS). It is used to retrieve, insert, update, and delete data from relational databases.*/

--Main functions of SQL:

--Retrieving Data:

--Data can be retrieved from the database using the SELECT statement.

SELECT * FROM Students; 

--Inserting Data

INSERT INTO Students (ID, Name, Age) VALUES (1, 'Rahim', 22);


--Updating Data

UPDATE Students SET Age = 23 WHERE ID = 1;

--Deleting Data

DELETE FROM Students WHERE ID = 1;

--Creating Tables

CREATE TABLE Students (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);


/* 
CREATE DATABASE
CREATE TABLE
INSERT INTO
SELECT
UPDATE
DELETE 
*/

--Basic SQL commands of MySQL

--Creating a new database

CREATE DATABASE School;
USE School;

-- New table Create 

CREATE TABLE Students (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Grade VARCHAR(10)
);

-- Data Insert 

INSERT INTO Students (ID, Name, Age, Grade) VALUES
(1, 'Rahim', 20, 'A'),
(2, 'Karim', 22, 'B');

-- Dta Retrive 

SELECT * FROM Students;
SELECT Name, Age FROM Students WHERE Grade = 'A';

--  Data Operate 
UPDATE Students SET Age = 23 WHERE ID = 1;

-- Data Delete 
DELETE FROM Students WHERE ID = 2;

--PostgreSQL Install 

sudo apt update
sudo apt install postgresql postgresql-contrib

-- Used SQL command 

CREATE DATABASE company;
\c company;

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL
);

--SQLite - Simple and lightweight database
--SQLite is perfect for mobile apps and small scale projects.
-- Install SQLite:

sudo apt install sqlite3
sqlite3 mydatabase.db

--Creating tables and inserting data:
CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT);
INSERT INTO users (name) VALUES ('John Doe');
SELECT * FROM users;

--Microsoft SQL Server - Enterprise Database
--SQL Server is mainly used in corporate companies.

sudo apt update
sudo apt install mssql-server

--Creating SQL Server tables and inserting data:
CREATE TABLE employees (id INT PRIMARY KEY, name NVARCHAR(100));
INSERT INTO employees VALUES (1, 'John Smith');

--Oracle Database - Professional Database

--Oracle database is used for large companies and banking systems.
--Oracle DB Install:
-- PL/SQL used
BEGIN
   DBMS_OUTPUT.PUT_LINE('Hello, Oracle!');
END;

--INNER JOIN (shows common data)

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    StudentID INT,
    CourseName VARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Students VALUES (1, 'Rahim'), (2, 'Karim');
INSERT INTO Courses VALUES (101, 1, 'Math'), (102, 1, 'Physics'), (103, 2, 'Biology');

SELECT Students.Name, Courses.CourseName
FROM Students
INNER JOIN Courses ON Students.StudentID = Courses.StudentID;

--LEFT JOIN (shows all data from the left table, NULL if none)
SELECT Students.Name, Courses.CourseName
FROM Students
LEFT JOIN Courses ON Students.StudentID = Courses.StudentID;











