CREATE DATABASE BarclaysBank
USE BarclaysBank

-- SQL (Structured Query Language) is used to interact with databases.

--Customer Table
CREATE TABLE Customers
(
CustomerID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
Phone VARCHAR(15),
Address VARCHAR(150),
AccountType VARCHAR(20),
Balance DECIMAL(10,2)
)
INSERT INTO Customers VALUES(1,'John','Doe','John.doe@gmail.com','1234560000','123 Street, NY','Savings',5000.00),
(2,'Jane','Smith','Jane.smith@gmail.com','7894560001','456 Avenue, LA','Current',3000.00),
(3,'Robert','Brown','Rober.bro@gmail.com','9632587410','789 Road, TX','Savings',7000.00)

SELECT * FROM Customers

--Transactions Table
CREATE TABLE Transactions
(
TransactionID INT PRIMARY KEY,
CustomerID INT,
TransactionType VARCHAR(50),
Amount DECIMAL(10,2),
TransactionDate DATETIME,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
)
INSERT INTO Transactions VALUES(1,1,'Deposit',1000.00,'2024-02-01 10:00:00'),
(2,2,'Withdrawal',500.00,'2024-02-02 14:00:00'),
(3,3,'Deposit',2000.00,'2024-02-01 09:30:00')

SELECT * FROM Transactions

--Intermediate Queries
-- Get Customers with Balance Above 5000

SELECT * FROM Customers WHERE Balance > 5000

-- Count Total Transactions

SELECT COUNT(*) AS TotalTransactions FROM Transactions

--Advanced Queries
-- Retrieve Customers with Highest Balance

SELECT * FROM Customers ORDER BY Balance DESC

-- Find Total Deposits for Each Customer

SELECT CustomerID, SUM(Amount) AS TotalDesposits FROM Transactions
WHERE TransactionType = 'Deposit'
GROUP BY CustomerID

-- Top 10 Interview Questions
--1- What is SQL?
-- SQL (Structured Query Language) is used to interact with databases.


--2- What is a JOIN? Give an Example
-- Retrieves customer names and their transaction amounts.

SELECT c.FirstName, c.LastNAme, t.Amount
FROM Customers c
JOIN Transactions t ON c.CustomerID = t.CustomerID

--3- What is an Index in SQL?
-- Creates an index on the Email column for faster searches.

CREATE INDEX idx_Customer_email ON Customers (Email)

--4- Explain GROUP BY with Example
-- Groups transactions by type and counts them.

SELECT TransactionType, COUNT(*) FROM Transactions GROUP BY TransactionType
	

--5- Difference Between WHERE and HAVING
-- WHERE filters before grouping, HAVING filters after grouping.

SELECT CustomerID, SUM(Amount) FROM Transactions
GROUP BY CustomerID
HAVING SUM(Amount) > 1000


--6- What are Aggregate Functions in SQL?
-- AVG, SUM, COUNT, MAX, and MIN are aggregate functions.

SELECT SUM(Balance) AS TotalBalance FROM Customers
SELECT AVG(Balance) AS AverageBalance FROM Customers
SELECT MIN(Balance) AS MinimumBalance FROM Customers
SELECT MAX(Balance) AS MaximunBalance FROM Customers
SELECT COUNT(*) AS TotalCustomers FROM Customers

--7- Using Aggregate Functions with GROUP BY
-- You can combine aggregate functions with GROUP BY to perform calculations for each group of data.
-- Find Total Deposits for Each Customer
-- This groups transactions by CustomerID and sums up deposit amounts.

SELECT CustomerID, SUM(Amount) AS TotalDeposits
FROM Transactions
WHERE TransactionType = 'Deposit'
GROUP BY CustomerID



