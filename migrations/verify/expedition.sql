-- Verify ocolis:expedition on pg

BEGIN;

SELECT * FROM expedition WHERE false;
SELECT expedition_id FROM package WHERE false;

ROLLBACK;
