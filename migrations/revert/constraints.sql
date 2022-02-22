-- Revert ocolis:constraints from pg

BEGIN;

ALTER TABLE package
DROP CONSTRAINT dates_order;

ALTER TABLE package
    ALTER COLUMN width TYPE int,
    ALTER COLUMN depth TYPE int,
    ALTER COLUMN height TYPE int,
    ALTER COLUMN worth TYPE int;


DROP DOMAIN postint;

COMMIT;
