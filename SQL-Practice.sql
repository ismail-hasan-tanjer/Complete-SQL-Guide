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




