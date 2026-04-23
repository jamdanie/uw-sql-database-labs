/* =========================================
   ORDER BY PRACTICE
   ========================================= */

-- 1. Sort customers by last name (A-Z)
SELECT FirstName, LastName
FROM Customers
ORDER BY LastName ASC;
/* Alphabetical order */

-- 2. Sort products by price (highest first)
SELECT ProductName, Price
FROM Products
ORDER BY Price DESC;
/* Most expensive first */

-- 3. Sort orders by date (newest first)
SELECT OrderID, OrderDate
FROM Orders
ORDER BY OrderDate DESC;
/* Recent orders first */

-- 4. Sort by multiple columns
SELECT FirstName, LastName
FROM Customers
ORDER BY LastName ASC, FirstName ASC;
/* Last name first, then first name */
