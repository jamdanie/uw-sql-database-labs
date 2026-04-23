/* =========================================
   GROUP BY PRACTICE
   ========================================= */

-- 1. Count how many orders each customer has
SELECT CustomerID, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY CustomerID;
/* Groups orders per customer */

-- 2. Find average product price by category
SELECT CategoryID, AVG(Price) AS AvgPrice
FROM Products
GROUP BY CategoryID;
/* Average price per category */

-- 3. Show only customers with more than 2 orders
SELECT CustomerID, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) > 2;
/* Filters grouped results */
