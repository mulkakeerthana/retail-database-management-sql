USE retail_db;

-- Test: a product price must not be negative
INSERT INTO products (
    category_id,
    product_name,
    sku,
    unit_price,
    stock_quantity
)
VALUES (
    1,
    'Invalid Test Product',
    'TEST-NEG-001',
    -10.00,
    10
);

-- Test: order quantity must be greater than zero
INSERT INTO order_items (
    order_id,
    product_id,
    quantity,
    unit_price
)
VALUES (
    1,
    1,
    0,
    599.99
);

-- Test: an order cannot use a customer ID that does not exist
INSERT INTO `orders` (
    customer_id,
    order_date,
    order_status,
    total_amount
)
VALUES (
    999,
    '2026-10-07 10:00:00',
    'Completed',
    500.00
);