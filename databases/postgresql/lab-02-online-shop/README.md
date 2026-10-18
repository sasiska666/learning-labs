# Lab 02: Online shop

Tables: customers, products, orders, order_items, plus the view `order_totals`. Covers CHECK with enumerated status, composite primary key, `ON DELETE CASCADE`, views, `NOT EXISTS`, aggregation and a transaction.

All names and data in `seed.sql` are invented placeholders.

> Written by Claude (Anthropic AI) from prompts by Mansur Karashashev. Not executed against a PostgreSQL server in the session that wrote it: run it on a local test database and fix any errors you find.

## Run
```bash
createdb labtest
psql labtest -f schema.sql -f seed.sql
psql labtest -f queries.sql
```
Use a local throwaway database, not a shared one.
