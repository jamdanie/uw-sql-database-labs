/* =========================================
   SUBQUERY PRACTICE
   ========================================= */

-- 1. Find products that cost more than the average price
SELECT ProductName, Price
FROM Products
WHERE Price > (
    SELECT AVG(Price)
    FROM Products
);
/* Filters products above average price */

-- 2. Find customers who have placed at least one order
SELECT FirstName, LastName
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
);
/* Uses subquery to match existing orders */

-- 3. Find the most expensive product
SELECT ProductName, Price
FROM Products
WHERE Price = (
    SELECT MAX(Price)
    FROM Products
);
/* Returns highest priced product */

-- 4. Find orders placed after the earliest order
SELECT OrderID, OrderDate
FROM Orders
WHERE OrderDate > (
    SELECT MIN(OrderDate)
    FROM Orders
);
/* Excludes earliest order */
