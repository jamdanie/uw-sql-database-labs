-- AP Database Schema
-- Course: T INFO 210
-- Exported from SQL Server (SSMS)
-- Organized for dependency order (FK-safe)

USE AP;
GO

/* =========================
   GLAccounts (no dependencies)
   ========================= */
CREATE TABLE [dbo].[GLAccounts](
    [AccountNo] [int] NOT NULL,
     NOT NULL,
    CONSTRAINT [PK_GLAccounts] PRIMARY KEY CLUSTERED ([AccountNo] ASC)
);
GO


/* =========================
   Terms (no dependencies)
   ========================= */
CREATE TABLE [dbo].[Terms](
    [TermsID] [int] IDENTITY(1,1) NOT NULL,
     NOT NULL,
    [TermsDueDays] [smallint] NOT NULL,
    CONSTRAINT [PK_Terms] PRIMARY KEY CLUSTERED ([TermsID] ASC)
);
GO


/* =========================
   Vendors (depends on GLAccounts, Terms)
   ========================= */
CREATE TABLE [dbo].[Vendors](
    [VendorID] [int] IDENTITY(1,1) NOT NULL,
     NOT NULL,
     NULL,
     NULL,
     NOT NULL,
     NOT NULL,
     NOT NULL,
     NULL,
     NULL,
     NULL,
    [DefaultTermsID] [int] NOT NULL,
    [DefaultAccountNo] [int] NOT NULL,
    CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED ([VendorID] ASC)
);
GO

ALTER TABLE [dbo].[Vendors] 
ADD CONSTRAINT [DF_Vendors_TermsID] DEFAULT ((3)) FOR [DefaultTermsID];
GO

ALTER TABLE [dbo].[Vendors] 
ADD CONSTRAINT [DF_Vendors_AccountNo] DEFAULT ((570)) FOR [DefaultAccountNo];
GO

ALTER TABLE [dbo].[Vendors]
ADD CONSTRAINT [FK_Vendors_GLAccounts] 
FOREIGN KEY([DefaultAccountNo]) REFERENCES [dbo].[GLAccounts]([AccountNo]);
GO

ALTER TABLE [dbo].[Vendors]
ADD CONSTRAINT [FK_Vendors_Terms] 
FOREIGN KEY([DefaultTermsID]) REFERENCES [dbo].[Terms]([TermsID]);
GO


/* =========================
   Invoices (depends on Vendors, Terms)
   ========================= */
CREATE TABLE [dbo].[Invoices](
    [InvoiceID] [int] IDENTITY(1,1) NOT NULL,
    [VendorID] [int] NOT NULL,
     NOT NULL,
    [InvoiceDate] [date] NOT NULL,
    [InvoiceTotal] [money] NOT NULL,
    [PaymentTotal] [money] NOT NULL,
    [CreditTotal] [money] NOT NULL,
    [TermsID] [int] NOT NULL,
    [InvoiceDueDate] [date] NOT NULL,
    [PaymentDate] [date] NULL,
    CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED ([InvoiceID] ASC)
);
GO

ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [DF_Invoices_PaymentTotal] DEFAULT ((0)) FOR [PaymentTotal];
GO

ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [DF_Invoices_CreditTotal] DEFAULT ((0)) FOR [CreditTotal];
GO

ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [FK_Invoices_Terms]
FOREIGN KEY([TermsID]) REFERENCES [dbo].[Terms]([TermsID]);
GO

ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [FK_Invoices_Vendors]
FOREIGN KEY([VendorID]) REFERENCES [dbo].[Vendors]([VendorID]);
GO


/* =========================
   InvoiceLineItems (depends on Invoices, GLAccounts)
   ========================= */
CREATE TABLE [dbo].[InvoiceLineItems](
    [InvoiceID] [int] NOT NULL,
    [InvoiceSequence] [smallint] NOT NULL,
    [AccountNo] [int] NOT NULL,
    [InvoiceLineItemAmount] [money] NOT NULL,
    :contentReference[oaicite:12]{index=12} NOT NULL,
    CONSTRAINT [PK_InvoiceLineItems] PRIMARY KEY CLUSTERED 
    ([InvoiceID] ASC, [InvoiceSequence] ASC)
);
GO

ALTER TABLE [dbo].[InvoiceLineItems]
ADD CONSTRAINT [FK_InvoiceLineItems_GLAccounts]
FOREIGN KEY([AccountNo]) REFERENCES [dbo].[GLAccounts]([AccountNo]);
GO

ALTER TABLE [dbo].[InvoiceLineItems]
ADD CONSTRAINT [FK_InvoiceLineItems_Invoices]
FOREIGN KEY([InvoiceID]) REFERENCES [dbo].[Invoices]([InvoiceID])
ON DELETE CASCADE;
GO


/* =========================
   InvoiceArchive (no FK constraints)
   ========================= */
CREATE TABLE [dbo].[InvoiceArchive](
    [InvoiceID] [int] NOT NULL,
    [VendorID] [int] NOT NULL,
     NOT NULL,
    [InvoiceDate] [date] NOT NULL,
    [InvoiceTotal] [money] NOT NULL,
    [PaymentTotal] [money] NOT NULL,
    [CreditTotal] [money] NOT NULL,
    [TermsID] [int] NOT NULL,
    [InvoiceDueDate] [date] NOT NULL,
    [PaymentDate] [date] NULL
);
GO


/* =========================
   ContactUpdates (standalone)
   ========================= */
CREATE TABLE [dbo].[ContactUpdates](
    [VendorID] [int] IDENTITY(1,1) NOT NULL,
     NULL,
     NULL
);
GO