BEGIN;

-- modif du champ serial_number en type TEXT
-- cette conversion number -> text marchera systématiquement
-- pas de question existentielle dans ce sens là
-- on pourra avoir des soucis pour des conversions text -> number seulement
ALTER TABLE package
    ALTER COLUMN serial_number TYPE TEXT;

COMMIT;