CREATE DATABASE CustomerDataDB;
USE CustomerDataDB;
go
--dim table
CREATE TABLE Customer (
    CustomerID INT PRIMARY key ,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

--dim table
CREATE TABLE Interaction (
    InteractionID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
    InteractionType VARCHAR(50),
    Date DATE,
    Notes VARCHAR(MAX)
);

--fact table
CREATE TABLE trnsaction (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
	InteractionID INT references Interaction,
    TransactionDate DATEtime,
    Amount DECIMAL(10,2)
);

/*___________________________________________________*/
INSERT INTO Customer (CustomerID,FirstName, LastName, Email, Phone, Address)
VALUES 
(1,'ayaat', 'ahmed', 'ayaat.ahmed@example.com', '555-1111', '123 Elm St'),
(2,'shahd', 'ahmed', 'shahd.ahmed@example.com', '555-2222', '456 Oak St'),
(3,'maryam', 'mohamed', 'maryam.mohamed@example.com', '555-3333', '789 Pine St'),
(4,'renad', 'haytham', 'renad.haytham@example.com', '555-4444', '101 Maple Ave'),
(5,'salma', 'ashraf', 'salma.ashraf@example.com', '555-5555', '202 Birch Rd'),
(6,'reem', 'salah', 'reem.salah@example.com', '555-6666', '303 Cedar Ln'),
(7,'James', 'Lee', 'james.lee@example.com', '555-7777', '404 Cherry St'),
(8,'Emma', 'White', 'emma.white@example.com', '555-8888', '505 Walnut Dr'),
(9,'Robert', 'Harris', 'robert.harris@example.com', '555-9999', '606 Redwood Blvd'),
(10,'Olivia', 'Walker', 'olivia.walker@example.com', '555-0001', '707 Fir Ct'),
(11,'Daniel', 'Hall', 'daniel.hall@example.com', '555-0002', '808 Ash Ln'),
(12,'Sophia', 'Young', 'sophia.young@example.com', '555-0003', '909 Sycamore St'),
(13,'Christopher', 'King', 'christopher.king@example.com', '555-0004', '1010 Palm Ave'),
(14,'Ava', 'Baker', 'ava.baker@example.com', '555-0005', '1111 Poplar St'),
(15,'Ethan', 'Scott', 'ethan.scott@example.com', '555-0006', '1212 Willow Rd'),
(16,'Isabella', 'Green', 'isabella.green@example.com', '555-0007', '1313 Pine St'),
(17,'Liam', 'Adams', 'liam.adams@example.com', '555-0008', '1414 Cypress Blvd'),
(18,'Mia', 'Carter', 'mia.carter@example.com', '555-0009', '1515 Aspen Dr'),
(19,'Alexander', 'Mitchell', 'alexander.mitchell@example.com', '555-0010', '1616 Hickory Ct'),
(20,'Charlotte', 'Perez', 'charlotte.perez@example.com', '555-0011', '1717 Spruce St');
/*interaction fisrt__________________________________________________________________________________*/
INSERT INTO Trnsaction (CustomerID, InteractionID, TransactionDate, Amount)
VALUES 
(1, 1, '2024-09-01', 100.00),
(2, 2, '2024-09-02', 250.00),
(3, 3, '2024-09-03', 300.00),
(4, 4, '2024-09-04', 50.00),
(5, 5, '2024-09-05', 75.00),
(6, 6, '2024-09-06', 200.00),
(7, 7, '2024-09-07', 180.00),
(8, 8, '2024-09-08', 220.00),
(9, 9, '2024-09-09', 150.00),
(10, 10, '2024-09-10', 400.00),
(11, 11, '2024-09-11', 350.00),
(12, 12, '2024-09-12', 90.00),
(13, 13, '2024-09-13', 120.00),
(14, 14, '2024-09-14', 60.00),
(15, 15, '2024-09-15', 280.00),
(16, 16, '2024-09-16', 140.00),
(17, 17, '2024-09-17', 210.00),
(18, 18, '2024-09-18', 310.00),
(19, 19, '2024-09-19', 180.00),
(20, 20, '2024-09-20', 500.00);

/*___________________________________________________________________________*/
INSERT INTO Interaction (CustomerID, InteractionType, Date, Notes)
VALUES 
(1, 'Phone Call', '2024-09-01', 'Discussed new product options.'),
(2, 'Email', '2024-09-02', 'Sent promotional offers.'),
(3, 'Meeting', '2024-09-03', 'Reviewed past orders.'),
(4, 'Phone Call', '2024-09-04', 'Followed up on a recent transaction.'),
(5, 'Email', '2024-09-05', 'Resolved customer inquiry.'),
(6, 'Meeting', '2024-09-06', 'Discussed future purchases.'),
(7, 'Phone Call', '2024-09-07', 'Confirmed shipping details.'),
(8, 'Email', '2024-09-08', 'Sent discount offer.'),
(9, 'Meeting', '2024-09-09', 'Explored partnership opportunities.'),
(10, 'Phone Call', '2024-09-10', 'Followed up on a previous issue.'),
(11, 'Email', '2024-09-11', 'Requested feedback on service.'),
(12, 'Meeting', '2024-09-12', 'Reviewed product details.'),
(13, 'Phone Call', '2024-09-13', 'Provided additional product info.'),
(14, 'Email', '2024-09-14', 'Sent loyalty rewards info.'),
(15, 'Meeting', '2024-09-15', 'Discussed bulk purchase discounts.'),
(16, 'Phone Call', '2024-09-16', 'Addressed service concerns.'),
(17, 'Email', '2024-09-17', 'Sent thank-you email for the purchase.'),
(18, 'Meeting', '2024-09-18', 'Reviewed service agreements.'),
(19, 'Phone Call', '2024-09-19', 'Confirmed appointment details.'),
(20, 'Email', '2024-09-20', 'Followed up on a new customer request.');
/*_______________________________________________________________________________*/
/*extract data
Extract Customer Information*/
SELECT CustomerID, FirstName, LastName, Email, Phone, Address
FROM Customer;

/* Extract Customer and Their Transactions*/
SELECT C.CustomerID, C.FirstName, C.LastName, T.TransactionDate, T.Amount
FROM Customer C
JOIN Trnsaction T ON C.CustomerID = T.CustomerID;

/*Extract Customers Who Have No Transactions (Left Join)*/
SELECT C.CustomerID, C.FirstName, C.LastName
FROM Customer C
LEFT JOIN Trnsaction T ON C.CustomerID = T.CustomerID
WHERE T.TransactionID IS NULL;

/*2)Updating Data
Update Customer Email*/
UPDATE Customer
SET Email = 'ayota.new@example.com'
WHERE CustomerID = 1;

/*Update Transaction Amount Based on Conditions*/
UPDATE Trnsaction
SET Amount = Amount * 1.10 /*Increase transaction amounts by 10% for transactions above $100*/
WHERE Amount > 100;

/*3) Analyzing Data
 Total Transaction Amount by Each Customer*/

SELECT C.CustomerID, C.FirstName, C.LastName, SUM(T.Amount) AS TotalSpent /*Sum up the transaction amounts for each customer*/
FROM Customer C
JOIN Trnsaction T ON C.CustomerID = T.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName;

/*Customers with Transactions smaller Than 100*/
SELECT DISTINCT C.CustomerID, C.FirstName, C.LastName
FROM Customer C
JOIN Trnsaction T ON C.CustomerID = T.CustomerID
WHERE T.Amount < 100;


INSERT INTO Trnsaction (CustomerID, InteractionID, TransactionDate, Amount)
VALUES 
(3, 9, '2024-09-09', 600.00),
(4, 4, '2024-08-31', 50.00),
(1, 1, '2024-08-30', 500.00);

INSERT INTO Interaction (CustomerID, InteractionType, Date, Notes)
VALUES 
(3, 'Phone Call', '2024-09-09', 'Discussed new product options.'),
(4, 'Email', '2024-08-31', 'Sent promotional offers.'),
(1, 'Meeting', '2024-08-30', 'Reviewed past orders.');



truncate table error_customer;
drop table trnsaction;
drop table Interaction;
drop table Customer ;

truncate table error_interact ;

truncate table transaction_error ;
