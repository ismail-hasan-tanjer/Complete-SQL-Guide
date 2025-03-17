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



---SQL Performance Optimization Techniques...
/*
🔹 Optimize queries using EXPLAIN or EXECUTION PLAN
🔹 Avoid unnecessary SELECT * and use specific columns
🔹 Execute queries faster through indexing
🔹 Manage Big Data using Partitioning
🔹 Reduce query load using caching  */


--Big Data & SQL Integration Guide

/*SQL is integrated with Azure SQL, AWS RDS, and PySpark SQL for Big Data usage. It makes it easy to process large amounts of data and can be used in AI, Machine Learning, and Data Analytics.*/

1. Azure SQL Database Integration

Microsoft Azure SQL Cloud-Based Relational Database that provides Scalability, Security & High Availability.

Steps to create Azure SQL:
1️ Log in to the Azure Portal.
2️ Go to SQL Databases > Create SQL Database.
3️ Select Database Name, Server Name, Authentication Mode (SQL/Auth), Compute + Storage.
4️ Click Review & Create.

Data Import into Azure SQL (with Python)

import pyodbc

server = 'your-azure-server.database.windows.net'
database = 'your-database'
username = 'your-username'
password = 'your-password'
driver = '{ODBC Driver 17 for SQL Server}'

conn = pyodbc.connect(f'DRIVER={driver};SERVER={server};DATABASE={database};UID={username};PWD={password}')
cursor = conn.cursor()

# SQL Query
cursor.execute("SELECT * FROM Customers")
rows = cursor.fetchall()

for row in rows:
    print(row)

conn.close()

/*2. AWS RDS (Relational Database Service)
AWS RDS Cloud-Based Managed SQL Database that supports MySQL, PostgreSQL, SQL Server.

 Steps to create AWS RDS:
1️ Go to AWS Management Console > RDS.
2️ Select Create Database > Engine Type (MySQL/PostgreSQL/SQL Server).
3️ Set DB Instance Class, Storage, Authentication Details.
4️ Click Create Database.*/

--Running SQL Queries with Python on AWS RDS
import pymysql

host = "your-rds-endpoint.amazonaws.com"
user = "your-username"
password = "your-password"
database = "your-database"

conn = pymysql.connect(host=host, user=user, password=password, database=database)
cursor = conn.cursor()

# SQL Query
cursor.execute("SELECT * FROM Employees")
rows = cursor.fetchall()

for row in rows:
    print(row)

conn.close()

/*3. PySpark SQL (Big Data Processing)
Apache Spark is a Big Data Processing Framework, where SQL Queries can be executed using PySpark SQL.*/

-- Install PySpark (Python)
pip install pyspark

--Creating DataFrame using PySpark SQL

from pyspark.sql import SparkSession

# Spark Session 
spark = SparkSession.builder.appName("SQL_Integration").getOrCreate()

# DataFrame  (Big Data Processing)
data = [("Tanjer", 27), ("Rahim", 30), ("Karim", 25)]
columns = ["Name", "Age"]
df = spark.createDataFrame(data, columns)

# SQL Query 
df.createOrReplaceTempView("people")
result = spark.sql("SELECT * FROM people WHERE Age > 26")
result.show()

--Running Data Query from CSV File with PySpark SQL

df = spark.read.csv("big_data.csv", header=True, inferSchema=True)
df.createOrReplaceTempView("bigdata")

# SQL Query 
query_result = spark.sql("SELECT category, COUNT(*) FROM bigdata GROUP BY category")
query_result.show()


--Azure SQL: Cloud-Based Managed SQL Guide

--Azure SQL is Microsoft Azure's cloud-based relational database that ensures high availability, scalability, and security. It is used for AI, Machine Learning, Big Data Analytics, and Web Applications.

--1. What is Azure SQL?
--Azure SQL is a fully managed cloud database built on Microsoft SQL Server. It works like on-premise SQL Server, but server management, backups, and security are handled by Microsoft.
/*
 Automatic Backups & High Availability
 Built-in AI & ML Support
 Scalability & Performance Optimization

*/
--How to create Azure SQL Database
--To use Azure SQL, you must first create a SQL Database in the Azure Portal.

-- Steps to create Azure SQL Database (GUI Mode)
/*
1️ Login to Azure Portal: portal.azure.com
2️ Go to SQL Databases > Create SQL Database.
3️ Select Database Name, Server Name, Authentication Mode (SQL/Auth), Compute + Storage.
4️ Click Review & Create.
*/

--Creating Azure SQL Database (CLI Mode)
/*
az sql server create --name myazuresqlserver --resource-group myResourceGroup --location eastus --admin-user adminUser --admin-password MyStrongP@ssword!
az sql db create --resource-group myResourceGroup --server myazuresqlserver --name myDatabase --service-objective S0

*/

-- 3. Import Data and Run Queries in Azure SQL
-- After creating Azure SQL Database, we can insert, update, and query data using Python.

--Connecting to Azure SQL Server with Python 

import pyodbc

# Azure SQL Server Configuration
server = 'your-azure-server.database.windows.net'
database = 'your-database'
username = 'your-username'
password = 'your-password'
driver = '{ODBC Driver 17 for SQL Server}'

# Connection 
conn = pyodbc.connect(f'DRIVER={driver};SERVER={server};DATABASE={database};UID={username};PWD={password}')
cursor = conn.cursor()

# SQL Query 
cursor.execute("SELECT * FROM Customers")
rows = cursor.fetchall()

for row in rows:
    print(row)

conn.close()

/*
4. Azure SQL Security & Performance Optimization

Ensuring Security & Performance is very important when using Azure SQL.

✅ Security Best Practices
🔒 Enable Firewall Rules - Allow access only from specific IPs.
🔒 Use Managed Identity Authentication - Use Managed Identity instead of User & Password Authentication.
🔒 Enable Transparent Data Encryption (TDE) - Ensure Data Encryption.

✅ Performance Optimization
⚡ Use Indexing - Use Indexes to increase Query Performance.
⚡ Enable Query Performance Insights - Enable Azure's Performance Insights to optimize slow queries.
⚡ Use Elastic Pool - Place multiple databases in an Elastic Pool for cost-effective scaling.
*/

5. Azure SQL Monitoring ও Automation
To keep Azure SQL Efficient & Reliable, Monitoring & Automation is required.

✅ Azure SQL Database Monitoring
1️⃣ Track Performance & Query Execution using Azure Monitor.
2️⃣ Analyze Error Logs & Query Performance using Azure Log Analytics.
3️⃣ Setup Azure Alert System to get notified when High CPU Usage, Slow Query, or Security Breach occurs.

 Azure SQL Automation (Auto-Scaling & Backup)
 az sql db update --resource-group myResourceGroup --server myazuresqlserver --name myDatabase --service-objective P2

** Auto-Scaling Enabled! - Running this command will automatically scale up/down according to the database load.


Azure SQL Query Optimization Guide

Azure SQL Query Optimization is a set of performance tuning techniques that ensure reducing query execution time, utilizing indexing, and increasing query efficiency.



1. 5 Steps to Check Query Performance Issue
✅ Use Query Execution Plan
✅ Use Indexes (Clustered & Non-Clustered)
✅ Use Partitioning & Caching
✅ Use Query Rewrite & Stored Procedures
✅ Enable Azure SQL Performance Insights & Query Store


2. Analyze Query Execution Plan
The Execution Plan in Azure SQL shows you how SQL Server is executing a query.
It helps to find Indexes, Joins, and Performance Bottlenecks.

✅ SQL Query to run the Execution Plan:

SET STATISTICS IO ON;

SET STATISTICS TIME ON;

EXPLAIN SELECT * FROM Customers WHERE City = 'Dhaka';



3. Indexing: The most important step in Query Optimization
✅ Clustered Index: Works as the Primary Key of the Table.
✅ Non-Clustered Index: Used to execute Search Query faster.
✅ Filtered Index: Only for Specific Columns.

✅ SQL Query to create Index:

-- Clustered Index
CREATE CLUSTERED INDEX idx_customer_id ON Customers(CustomerID);

-- Non-Clustered Index
CREATE NONCLUSTERED INDEX idx_customer_city ON Customers(City);
✅ Query to remove Index:

DROP INDEX idx_customer_city ON Customers;

--4. Using Partitioning & Caching for Query Optimization
✅ Partitioning:
When working with large tables (Large Datasets), Partitioning is used to reduce Query Execution Time.

--code  

CREATE PARTITION FUNCTION pfOrderDate (DATE)
AS RANGE LEFT FOR VALUES ('2023-01-01', '2024-01-01');

--Caching & Query Store:
Uses Azure SQL Query Store to cache frequent queries to reduce execution time.

--code 

ALTER DATABASE myDatabase  
SET QUERY_STORE = ON;

Using Query Rewrite & Stored Procedures
✅ Efficient Query Writing:
❌ Bad Query:

SELECT * FROM Orders WHERE YEAR(OrderDate) = 2024;

Optimized Query:

SELECT * FROM Orders WHERE OrderDate >= '2024-01-01' AND OrderDate < '2025-01-01';

Optimizing Query using Stored Procedure:
