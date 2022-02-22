-- Revert ocolis:vehicle_plate from pg

BEGIN;

ALTER TABLE expedition
    ALTER COLUMN vehicle_plate TYPE TEXT NOT NULL,

DROP DOMAIN immat;

ALTER TABLE place
    ALTER COLUMN postal_code TYPE INT NOT NULL,

DROP DOMAIN zip_code;

COMMIT;
