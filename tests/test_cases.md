# Test Cases

| Test ID | Test Description | Expected Result | Actual Result | Status |
|---|---|---|---|---|
| TC-01 | Insert valid sample data | Data is inserted successfully | Sample data inserted successfully | Pass |
| TC-02 | Check table record counts | All required records are available | 6 categories, 10 customers, 15 products, 10 orders, 16 order items, 10 payments | Pass |
| TC-03 | Validate order, customer, and payment relationships | Orders display the correct customer and payment details | Query returned valid linked records | Pass |
| TC-04 | Run business reports | Reports return useful retail insights | Sales, products, customers, and payment reports returned successfully | Pass |
| TC-05 | Insert a product with a negative price | Database rejects the record | Check constraint rejected the record | Pass |
| TC-06 | Insert an order item with quantity zero | Database rejects the record | Check constraint rejected the record | Pass |
| TC-07 | Insert an order for a non-existent customer | Database rejects the record | Foreign-key constraint rejected the record | Pass |
| TC-08 | Verify indexes | Required indexes exist | Four indexes were successfully created | Pass |
| TC-09 | Back up and restore the database | Restored database contains tables and sample data | Restore validation completed successfully | Pass |

## Evidence Files

- `evidence/01_table_counts.png`
- `evidence/10_negative_price_constraint_test.png`
- `evidence/11_zero_quantity_constraint_test.png`
- `evidence/12_foreign_key_constraint_test.png`
- `evidence/13_backup_export.png`
- `evidence/14_restore_validation.png`