USE retail_db;

ALTER TABLE products
ADD CONSTRAINT chk_products_unit_price
CHECK (unit_price > 0);

ALTER TABLE products
ADD CONSTRAINT chk_products_stock_quantity
CHECK (stock_quantity >= 0);

ALTER TABLE order_items
ADD CONSTRAINT chk_order_items_quantity
CHECK (quantity > 0);

ALTER TABLE order_items
ADD CONSTRAINT chk_order_items_unit_price
CHECK (unit_price > 0);

ALTER TABLE `orders`
ADD CONSTRAINT chk_orders_total_amount
CHECK (total_amount >= 0);

ALTER TABLE payments
ADD CONSTRAINT chk_payments_amount
CHECK (amount >= 0);