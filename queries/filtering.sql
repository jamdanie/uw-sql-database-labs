-- FILTERING PRACTICE

-- Vendors in CA
SELECT VendorName, VendorState
FROM Vendors
WHERE VendorState = 'CA';

-- Invoices over $1000
SELECT InvoiceNumber, InvoiceTotal
FROM Invoices
WHERE InvoiceTotal > 1000;