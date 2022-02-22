-- Verify ocolis:transition on pg

BEGIN;

SELECT * FROM package WHERE false;
SELECT * FROM place WHERE false;

ROLLBACK;
