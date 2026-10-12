# Retail Database Design & Optimization

## Project Overview

This project is a MySQL database system designed for a fictional retail store. It manages customers, product categories, products, orders, order items, and payments.

The database supports accurate sales reporting, customer analysis, product analysis, data validation, backup, and restore verification.

## Project Objective

Design and optimize a normalized retail database that efficiently manages customers, products, orders, and sales data while supporting accurate business reporting and decision-making.

## Stakeholder

Retail store owner or manager.

## Features

- Customer management
- Product and category management
- Order and order-item management
- Payment tracking
- Primary keys, foreign keys, unique constraints, and check constraints
- Business reports for sales, products, customers, and payments
- Reporting views
- Indexes for query optimization
- Data-validation tests
- Backup and restore validation

## Tools Used

- MySQL Server
- MySQL Workbench
- Visual Studio Code
- GitHub

## ER Diagram

![Retail ER Diagram](docs/retail_erd.png)

## Database Tables

| Table | Purpose |
|---|---|
| customers | Stores customer details |
| categories | Stores product categories |
| products | Stores retail products |
| orders | Stores customer orders |
| order_items | Stores products included in each order |
| payments | Stores payment details for orders |

## How to Run the Project

Run these SQL files in MySQL Workbench in this order:

1. `sql/01_create_schema.sql`
2. `sql/02_insert_sample_data.sql`
3. `sql/04_create_views.sql`
4. `sql/05_create_indexes.sql`
5. `sql/06_add_constraints.sql`

Then run these files to view reports and validate the project:

- `sql/03_business_queries.sql`
- `tests/01_data_validation.sql`
- `tests/02_view_validation.sql`
- `tests/03_index_validation.sql`
- `tests/04_constraint_tests.sql`

## Sample Business Reports

The project includes reports for:

- Total completed sales revenue
- Sales by category
- Top-selling products
- Top customers
- Customer order history
- Monthly sales
- Products never ordered
- Payment status
- Low-stock products
- Date-range orders

## Validation and Testing

The database was tested for:

- Correct table record counts
- Valid table relationships
- Negative-price rejection
- Zero-quantity rejection
- Foreign-key validation
- Index creation
- Backup and restore verification

Test details are available in `tests/test_cases.md`.

## Backup and Restore

A full database backup is available in:

```text
backup/retail_db_backup.sql