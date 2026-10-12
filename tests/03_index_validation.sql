USE retail_db;

SELECT
    table_name,
    index_name,
    GROUP_CONCAT(column_name ORDER BY seq_in_index) AS indexed_columns
FROM information_schema.statistics
WHERE table_schema = 'retail_db'
  AND index_name IN (
      'idx_orders_order_date',
      'idx_orders_status_date',
      'idx_products_product_name',
      'idx_payments_payment_status'
  )
GROUP BY table_name, index_name
ORDER BY table_name, index_name;