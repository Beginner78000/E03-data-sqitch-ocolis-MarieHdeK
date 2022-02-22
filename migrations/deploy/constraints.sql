-- Deploy ocolis:constraints to pg

BEGIN;

ALTER TABLE package
ADD CONSTRAINT dates_order
CHECK(request_time < delivered_time);

CREATE DOMAIN posint AS INT CHECK(VALUE > 0);

ALTER TABLE package
    ALTER COLUMN width TYPE posint,
    ALTER COLUMN depth TYPE posint,
    ALTER COLUMN height TYPE posint,
    ALTER COLUMN worth TYPE posint;

COMMIT;
