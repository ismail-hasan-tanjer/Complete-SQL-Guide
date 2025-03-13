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


--SQLite STORED PROCEDURE (not available in SQLite, but can be done via functions)
--SQLite does not have direct Stored Procedures, but functions can be used.

CREATE TEMP TABLE TempStudents AS
SELECT * FROM Students;

--Now it can be easily run:
SELECT * FROM TempStudents;

--Microsoft SQL Server: Detailed Analysis
--What is Microsoft SQL Server?
--Microsoft SQL Server (MSSQL) is a Relational Database Management System (RDBMS) developed by Microsoft. It helps in storing, managing and analyzing data using Structured Query Language (SQL). It is widely used as a database management system for small, medium and large businesses.

--Features of Microsoft SQL Server
--Relational database – Data is stored and managed through tables
-- T-SQL (Transact-SQL) – Specialized SQL language for SQL Server
-- Data security and encryption – Data Masking, Transparent Data Encryption (TDE)
-- Data backup and recovery – Automated backup & disaster recovery
-- Integration and reporting – SSIS (Integration Services), SSRS (Reporting Services)
-- Big data support – Big Data Clusters and Machine Learning Services
-- High performance – Query optimization and indexing

--How to Implement Microsoft SQL Server?
--Step 1: Install Microsoft SQL Server
--1️ Download Microsoft SQL Server from the official website
--2 Follow the installation wizard to complete the setup
--3️ Install SQL Server Management Studio (SSMS), which is a GUI-based management tool

--Creating a new database
CREATE DATABASE SchoolDB;

--Creating a new table 
USE SchoolDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name NVARCHAR(50),
    Age INT,
    Grade NVARCHAR(10)
);


--Inserting data into the database
INSERT INTO Students (StudentID, Name, Age, Grade)
VALUES (1, 'Rahim', 18, 'A'),
       (2, 'Karim', 19, 'B'),
       (3, 'Jamal', 20, 'A+');

--Retrieving data from the database
SELECT * FROM Students;

--Updating data
UPDATE Students
SET Grade = 'A'
WHERE StudentID = 2;

--Deleting data

DELETE FROM Students WHERE StudentID = 3;


--Advanced SQL Guide
-- 1. Stored Procedures & Functions
-- A Stored Procedure is a reusable SQL code block, which can be written once and used repeatedly.

-- Creating a Stored Procedure:

CREATE PROCEDURE GetAllCustomers  
AS  
BEGIN  
    SELECT * FROM Customers;  
END;

--Calling Stored Procedure:
EXEC GetAllCustomers;

--Creating a function (example: finding the length of a name)
CREATE FUNCTION GetNameLength(@Name VARCHAR(100))  
RETURNS INT  
AS  
BEGIN  
    RETURN LEN(@Name);  
END;

--Function usage:
SELECT dbo.GetNameLength('Ismail Hasan Tanjer');

--Views & Indexing
--Views: Creates Virtual Tables in the database, which helps in running queries faster.
--Creating Views:
CREATE VIEW CustomerView AS  
SELECT CustomerID, Name, Email FROM Customers WHERE Active = 1;

-- Indexes: Helps increase database performance.

--Index Create (Single Column Index)
CREATE INDEX idx_customer_name ON Customers(Name);

--Index Create (Multiple Columns)
CREATE INDEX idx_customer_multi ON Customers(Name, Email);



--Transactions & ACID Properties
--Transactions help execute multiple SQL operations together and maintain data integrity.

BEGIN TRANSACTION;  

UPDATE Accounts SET Balance = Balance - 500 WHERE AccountID = 1;  
UPDATE Accounts SET Balance = Balance + 500 WHERE AccountID = 2;  

IF @@ERROR = 0  
    COMMIT;  
ELSE  
    ROLLBACK;


--Recursive Queries & Common Table Expressions (CTE)
--CTE creates a temporary table, which helps in handling recursive queries.
--CTE Example:

WITH EmployeeHierarchy AS (  
    SELECT EmployeeID, Name, ManagerID FROM Employees WHERE ManagerID IS NULL  
    UNION ALL  
    SELECT e.EmployeeID, e.Name, e.ManagerID FROM Employees e  
    INNER JOIN EmployeeHierarchy eh ON e.ManagerID = eh.EmployeeID  
)  
SELECT * FROM EmployeeHierarchy;

