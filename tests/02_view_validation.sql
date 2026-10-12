USE retail_db;

SELECT * FROM vw_sales_summary;

SELECT *
FROM vw_product_sales
ORDER BY total_revenue DESC;

SELECT *
FROM vw_customer_spending
ORDER BY total_spent DESC;