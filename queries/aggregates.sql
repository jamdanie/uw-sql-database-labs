-- AGGREGATE FUNCTIONS

-- Total invoice amount
SELECT SUM(InvoiceTotal) AS TotalInvoices
FROM Invoices;

-- Average invoice
SELECT AVG(InvoiceTotal) AS AvgInvoice
FROM Invoices;

-- Count vendors
SELECT COUNT(*) AS TotalVendors
FROM Vendors;