# UW SQL Database Labs

This repository contains SQL Server database work completed as part of my coursework at the University of Washington Tacoma (T INFO 210).

---

## 📚 Overview

The purpose of this repository is to demonstrate practical understanding of:

- Relational database design
- SQL querying (SELECT, JOIN, filtering, aggregation, subqueries)
- Primary and foreign key relationships
- Database normalization and structure
- Real-world database modeling and deployment workflows

All databases and scripts were developed and tested using SQL Server Management Studio (SSMS).

---

## 🗂️ Repository Structure


uw-sql-database-labs/
│
├── ap-database/
├── uwt-database/
├── examples-database/
├── productorders-database/
├── queries/
└── README.md


---

## 🧱 Databases

Each database folder contains:

- `schema.sql` → Defines database structure (tables, constraints, relationships)
- `create_*.sql` → Populates tables with data (INSERT statements)

---

### 💼 AP Database (Accounts Payable)

Simulates a real-world financial system including:

- Vendors
- Invoices
- Invoice Line Items
- General Ledger (GL) Accounts
- Payment Terms

**Focus:**
- Real-world relational design
- Multi-table joins
- Financial data relationships

---

### 🎓 UWT Database

Course-related academic database used for structured SQL practice.

Includes:

- Students
- Courses
- Instructors
- Departments
- Student-Course relationships (junction table)

**Focus:**
- Foreign key relationships
- Many-to-many relationships
- Academic data modeling

---

### 📦 ProductOrders Database

Represents a simple ordering system:

- Customers
- Orders
- Products
- Order Details

**Focus:**
- Transactional data
- Multi-table joins
- Order tracking relationships

---

### 🧪 Examples Database

Lightweight database used for:

- Testing queries
- Practicing SQL concepts
- Experimenting with different query patterns

---

## 🔍 Queries

The `queries/` folder contains organized SQL practice files:

- `joins.sql` → Multi-table joins and relationships
- `filtering.sql` → WHERE clause conditions and filtering
- `aggregates.sql` → COUNT, SUM, AVG, GROUP BY
- `orderby.sql` → Sorting and multi-column ordering
- `subqueries.sql` → Nested queries and advanced filtering
- `groupby.sql` → Grouping and HAVING clauses

Each file demonstrates specific SQL techniques used throughout coursework.

---

## ⚙️ Setup Instructions

To run any database:

1. Open SQL Server Management Studio (SSMS)
2. Create the database:
   ```sql
   CREATE DATABASE DatabaseName;
   USE DatabaseName;
Execute:
schema.sql (creates structure)
create_*.sql (inserts data)
🧠 Key Concepts Demonstrated
Table relationships (1-to-many, many-to-many)
Foreign key constraints
Data integrity and normalization
Query optimization basics
Modular SQL scripting
📝 Notes
Schema files were generated and refined using SSMS
Data scripts were exported using "Generate Scripts" (Data Only)
Repository is structured to reflect real-world database project organization
🚀 Summary

This project reflects hands-on experience with:

Designing relational databases
Writing and organizing SQL queries
Managing database scripts in a version-controlled environment (Git/GitHub)

It serves as both a coursework archive and a foundational database portfolio.
