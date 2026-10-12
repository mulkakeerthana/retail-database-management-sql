USE retail_db;

-- Speeds up date-range and monthly sales reports
CREATE INDEX idx_orders_order_date
ON `orders` (order_date);

-- Speeds up filtering orders by status and date
CREATE INDEX idx_orders_status_date
ON `orders` (order_status, order_date);

-- Speeds up product-name searches
CREATE INDEX idx_products_product_name
ON products (product_name);

-- Speeds up payment-status reports
CREATE INDEX idx_payments_payment_status
ON payments (payment_status);