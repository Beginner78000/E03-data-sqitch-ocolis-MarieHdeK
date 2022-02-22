-- Revert ocolis:transition from pg

BEGIN;

DROP TABLE package, place; -- toujours supprimer les tables qui ont des clés étrangère en premier

COMMIT;
