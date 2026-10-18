# Lab 03: University

Tables: students, courses, enrollments (many-to-many with a grade). Covers many-to-many modelling, NULL handling, `RANK() OVER (PARTITION BY ...)`, `COALESCE`, conditional joins.

All names and data in `seed.sql` are invented placeholders.

> Written by Claude (Anthropic AI) from prompts by Mansur Karashashev. Not executed against a PostgreSQL server in the session that wrote it: run it on a local test database and fix any errors you find.

## Run
```bash
createdb labtest
psql labtest -f schema.sql -f seed.sql
psql labtest -f queries.sql
```
Use a local throwaway database, not a shared one.
