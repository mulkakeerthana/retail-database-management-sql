# Database Optimization

## Purpose
Indexes were added to improve the performance of commonly used retail reports and searches.

## Indexes Added

| Index Name | Table | Column(s) | Purpose |
|---|---|---|---|
| idx_orders_order_date | orders | order_date | Speeds up date-range and monthly sales reports. |
| idx_orders_status_date | orders | order_status, order_date | Speeds up reports filtered by order status and date. |
| idx_products_product_name | products | product_name | Speeds up product-name searches. |
| idx_payments_payment_status | payments | payment_status | Speeds up payment-status reports. |

## Trade-off
Indexes improve read and search performance, but they can slightly increase the time needed to insert or update data. Therefore, indexes were added only for columns used frequently in reports and filters.

## Validation
The indexes were verified using a query against `information_schema.statistics`. Screenshot evidence is stored in `evidence/09_indexes_created.png`.