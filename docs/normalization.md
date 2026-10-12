# Database Normalization

## First Normal Form (1NF)
Each table has a primary key, and every column stores one atomic value. For example, an order can contain several products through separate rows in the `order_items` table instead of storing a list of products in one column.

## Second Normal Form (2NF)
Each table stores data that depends on its primary key. For example, product information depends on `product_id`, while customer information depends on `customer_id`.

## Third Normal Form (3NF)
Repeated information is separated into related tables to avoid unnecessary duplication.

Examples:
- Product categories are stored in the `categories` table instead of repeating category names for every product.
- Customer details are stored in `customers` instead of repeating them in every order.
- Order details and product details are separated through the `order_items` table.
- Payment details are stored separately in the `payments` table.

## Result
The design reduces duplicate data, improves data consistency, and makes updates easier and safer.