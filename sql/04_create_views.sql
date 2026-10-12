USE retail_db;

-- View 1: Easy order and payment summary for a retail manager
CREATE OR REPLACE VIEW vw_sales_summary AS
SELECT
    o.order_id,
    o.order_date,
    c.full_name AS customer_name,
    o.order_status,
    o.total_amount,
    p.payment_method,
    p.payment_status
FROM `orders` o
JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN payments p ON o.order_id = p.order_id;

-- View 2: Product sales performance report
CREATE OR REPLACE VIEW vw_product_sales AS
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    COALESCE(SUM(
        CASE
            WHEN o.order_status = 'Completed' THEN oi.quantity
            ELSE 0
        END
    ), 0) AS total_quantity_sold,
    COALESCE(SUM(
        CASE
            WHEN o.order_status = 'Completed' THEN oi.quantity * oi.unit_price
            ELSE 0
        END
    ), 0) AS total_revenue
FROM products p
JOIN categories c ON p.category_id = c.category_id
LEFT JOIN order_items oi ON p.product_id = oi.product_id
LEFT JOIN `orders` o ON oi.order_id = o.order_id
GROUP BY p.product_id, p.product_name, c.category_name;

-- View 3: Customer spending report
CREATE OR REPLACE VIEW vw_customer_spending AS
SELECT
    c.customer_id,
    c.full_name,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(
        CASE
            WHEN o.order_status = 'Completed' THEN o.total_amount
            ELSE 0
        END
    ), 0) AS total_spent
FROM customers c
LEFT JOIN `orders` o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name;