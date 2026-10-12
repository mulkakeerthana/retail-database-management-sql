USE retail_db;

-- 1. Total completed sales revenue
SELECT
    SUM(total_amount) AS total_completed_sales
FROM `orders`
WHERE order_status = 'Completed';

-- 2. Sales revenue by product category
SELECT
    c.category_name,
    SUM(oi.quantity * oi.unit_price) AS category_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
JOIN `orders` o ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.category_name
ORDER BY category_sales DESC;

-- 3. Top-selling products by quantity sold
SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN `orders` o ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC, total_revenue DESC;

-- 4. Top customers by completed order value
SELECT
    c.customer_id,
    c.full_name,
    COUNT(o.order_id) AS completed_orders,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN `orders` o ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_id, c.full_name
ORDER BY total_spent DESC;

-- 5. Customer order history
SELECT
    o.order_id,
    c.full_name,
    o.order_date,
    o.order_status,
    o.total_amount
FROM `orders` o
JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date DESC;

-- 6. Monthly sales report
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_sales
FROM `orders`
WHERE order_status = 'Completed'
GROUP BY DATE_FORMAT(order_date, '%Y-%m');

-- 7. Products that have never been ordered
SELECT
    p.product_id,
    p.product_name,
    p.stock_quantity
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.order_item_id IS NULL;

-- 8. Payment-status report
SELECT
    p.payment_status,
    COUNT(*) AS payment_count,
    SUM(p.amount) AS total_amount
FROM payments p
GROUP BY p.payment_status;

-- 9. Low-stock products
SELECT
    product_name,
    sku,
    stock_quantity
FROM products
WHERE stock_quantity < 30
ORDER BY stock_quantity;

-- 10. Orders in a date range
SELECT
    o.order_id,
    c.full_name,
    o.order_date,
    o.total_amount
FROM `orders` o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_date BETWEEN '2026-10-02' AND '2026-10-05 23:59:59'
ORDER BY o.order_date;