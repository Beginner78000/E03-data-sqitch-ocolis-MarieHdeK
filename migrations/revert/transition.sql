-- Revert ocolis:transition from pg

BEGIN;

DROP TABLE package, place, expedition; -- toujours supprimer les tables qui ont des clés étrangère en premier

COMMIT;
