-- JOINS PRACTICE

-- Example: Vendor + Invoice join
SELECT v.VendorName, i.InvoiceNumber, i.InvoiceTotal
FROM Vendors v
JOIN Invoices i
    ON v.VendorID = i.VendorID;

-- Example: Invoice + Line Items
SELECT i.InvoiceNumber, li.InvoiceLineItemAmount
FROM Invoices i
JOIN InvoiceLineItems li
    ON i.InvoiceID = li.InvoiceID;