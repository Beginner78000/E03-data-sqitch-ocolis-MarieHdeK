-- Verify ocolis:vehicle_plate on pg

BEGIN;

SELECT vehicle_plate FROM expedition WHERE false;

SELECT postal_code FROM place WHERE false;

ROLLBACK;
