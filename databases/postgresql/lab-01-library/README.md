# Lab 01: Library database

Tables: authors, books, members, loans. Covers primary and foreign keys, CHECK constraints, indexes, JOIN, LEFT JOIN, GROUP BY, `FILTER`, window functions.

All names and data in `seed.sql` are invented placeholders.

> Written by Claude (Anthropic AI) from prompts by Mansur Karashashev. Not executed against a PostgreSQL server in the session that wrote it: run it on a local test database and fix any errors you find.

## Run
```bash
createdb labtest
psql labtest -f schema.sql -f seed.sql
psql labtest -f queries.sql
```
Use a local throwaway database, not a shared one.
