-- Verify ocolis:constraints on pg

BEGIN;

SELECT * FROM package WHERE false;

ROLLBACK;
