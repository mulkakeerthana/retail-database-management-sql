USE retail_db;

-- Categories
INSERT INTO categories (category_name, description) VALUES
('Electronics', 'Electronic accessories and devices'),
('Home & Living', 'Home-use products'),
('Clothing', 'Apparel and fashion items'),
('Books', 'Technical and general books'),
('Grocery', 'Food and beverage items'),
('Personal Care', 'Personal hygiene products');

-- Customers
INSERT INTO customers (full_name, email, phone, address, created_at) VALUES
('Aarav Sharma', 'aarav.sharma@example.com', '9876500001', 'Hyderabad', '2026-10-01 09:00:00'),
('Diya Reddy', 'diya.reddy@example.com', '9876500002', 'Warangal', '2026-10-01 09:15:00'),
('Rahul Kumar', 'rahul.kumar@example.com', '9876500003', 'Karimnagar', '2026-10-01 09:30:00'),
('Ananya Singh', 'ananya.singh@example.com', '9876500004', 'Vijayawada', '2026-10-01 09:45:00'),
('Vikram Patel', 'vikram.patel@example.com', '9876500005', 'Bengaluru', '2026-10-01 10:00:00'),
('Sneha Gupta', 'sneha.gupta@example.com', '9876500006', 'Chennai', '2026-10-01 10:15:00'),
('Kiran Rao', 'kiran.rao@example.com', '9876500007', 'Hyderabad', '2026-10-01 10:30:00'),
('Meera Iyer', 'meera.iyer@example.com', '9876500008', 'Pune', '2026-10-01 10:45:00'),
('Arjun Verma', 'arjun.verma@example.com', '9876500009', 'Mumbai', '2026-10-01 11:00:00'),
('Priya Nair', 'priya.nair@example.com', '9876500010', 'Kochi', '2026-10-01 11:15:00');

-- Products
INSERT INTO products (category_id, product_name, sku, unit_price, stock_quantity) VALUES
(1, 'Wireless Mouse', 'ELEC-001', 599.99, 50),
(1, 'Mechanical Keyboard', 'ELEC-002', 1499.99, 30),
(1, 'Bluetooth Headphones', 'ELEC-003', 1999.99, 25),
(1, 'USB-C Cable', 'ELEC-004', 299.00, 100),
(2, 'LED Desk Lamp', 'HOME-001', 899.00, 40),
(2, 'Steel Water Bottle', 'HOME-002', 349.00, 60),
(3, 'Cotton T-Shirt', 'CLOT-001', 499.00, 80),
(3, 'Denim Jeans', 'CLOT-002', 1499.00, 45),
(4, 'SQL Basics Book', 'BOOK-001', 799.00, 35),
(4, 'Clean Code Book', 'BOOK-002', 999.00, 30),
(5, 'Coffee Pack', 'GROC-001', 399.00, 70),
(5, 'Green Tea Pack', 'GROC-002', 249.00, 65),
(6, 'Face Wash', 'CARE-001', 299.00, 55),
(6, 'Shampoo', 'CARE-002', 349.00, 50),
(1, 'Laptop Stand', 'ELEC-005', 1199.00, 20);

-- Orders
INSERT INTO `orders` (customer_id, order_date, order_status, total_amount) VALUES
(1, '2026-10-02 10:00:00', 'Completed', 898.99),
(2, '2026-10-02 11:00:00', 'Completed', 1499.99),
(3, '2026-10-03 12:00:00', 'Pending', 1999.99),
(4, '2026-10-03 14:00:00', 'Completed', 998.00),
(5, '2026-10-04 10:30:00', 'Completed', 1499.00),
(6, '2026-10-04 15:00:00', 'Completed', 1798.00),
(7, '2026-10-05 09:30:00', 'Completed', 1047.00),
(8, '2026-10-05 13:00:00', 'Completed', 648.00),
(9, '2026-10-06 11:30:00', 'Completed', 1248.00),
(10, '2026-10-06 16:00:00', 'Completed', 1798.99);

-- Order items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 599.99), (1, 4, 1, 299.00),
(2, 2, 1, 1499.99),
(3, 3, 1, 1999.99),
(4, 7, 2, 499.00),
(5, 8, 1, 1499.00),
(6, 9, 1, 799.00), (6, 10, 1, 999.00),
(7, 11, 2, 399.00), (7, 12, 1, 249.00),
(8, 13, 1, 299.00), (8, 14, 1, 349.00),
(9, 5, 1, 899.00), (9, 6, 1, 349.00),
(10, 15, 1, 1199.00), (10, 1, 1, 599.99);

-- Payments
INSERT INTO payments (order_id, payment_date, payment_method, payment_status, amount) VALUES
(1, '2026-10-02 10:05:00', 'UPI', 'Paid', 898.99),
(2, '2026-10-02 11:05:00', 'Card', 'Paid', 1499.99),
(3, '2026-10-03 12:05:00', 'Card', 'Pending', 1999.99),
(4, '2026-10-03 14:05:00', 'Cash', 'Paid', 998.00),
(5, '2026-10-04 10:35:00', 'UPI', 'Paid', 1499.00),
(6, '2026-10-04 15:05:00', 'Card', 'Paid', 1798.00),
(7, '2026-10-05 09:35:00', 'UPI', 'Paid', 1047.00),
(8, '2026-10-05 13:05:00', 'Cash', 'Paid', 648.00),
(9, '2026-10-06 11:35:00', 'Card', 'Paid', 1248.00),
(10, '2026-10-06 16:05:00', 'UPI', 'Paid', 1798.99);