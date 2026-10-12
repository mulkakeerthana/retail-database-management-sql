# Backup and Restore Validation

## Backup
A complete backup of the `retail_db` database was created using MySQL Workbench Data Export.

- Backup file: `backup/retail_db_backup.sql`
- Export type: Self-contained SQL file
- Included: Database schema and table data

## Restore Test
To avoid affecting the original database, the backup was copied and restored into a separate database:

```text
retail_db_restore_test