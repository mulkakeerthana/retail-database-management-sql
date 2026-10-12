USE retail_db;

-- Check the number of records in every table
SELECT 'categories' AS table_name, COUNT(*) AS row_count FROM categories
UNION ALL
SELECT 'customers', COUNT(*) FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM `orders`
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'payments', COUNT(*) FROM payments;

-- Check that orders connect correctly to customers and payments
SELECT
    o.order_id,
    c.full_name,
    o.order_status,
    o.total_amount,
    p.payment_status
FROM `orders` o
JOIN customers c ON o.customer_id = c.customer_id
JOIN payments p ON o.order_id = p.order_id;