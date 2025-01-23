
CREATE DATABASE ProductDB;
USE ProductDB;
CREATE TABLE Categories ( CategoryID INT PRIMARY KEY,
CategoryName VARCHAR(100)
);
CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
CategoryID INT,
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
CREATE TABLE Prices (
PriceID INT PRIMARY KEY,
ProductID INT,
Price DECIMAL(10, 2),
Currency VARCHAR(10),
PriceDate DATE,
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
INSERT INTO Categories (CategoryID, CategoryName)
VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books');
INSERT INTO Products (ProductID, ProductName, CategoryID)
VALUES
(1, 'Laptop', 1),
(2, 'Smartphone', 1),
(3, 'Jeans', 2),
(4, 'T-Shirt', 2),
(5, 'Novel', 3),
(6, 'Textbook', 3);
INSERT INTO Prices (PriceID, ProductID, Price, Currency, PriceDate)
VALUES
(1, 1, 999.99, 'USD', '2025-01-15'),
(2, 2, 699.99, 'USD', '2025-01-16'),
(3, 3, 49.99, 'USD', '2025-01-17'),
(4, 4, 19.99, 'USD', '2025-01-18'),
(5, 5, 14.99, 'USD', '2025-01-19'),
(6, 6, 79.99, 'USD', '2025-01-20');
SELECT p.ProductName, c.CategoryName, pr.Price, pr.Currency, pr.PriceDate
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
JOIN Prices pr ON p.ProductID = pr.ProductID;