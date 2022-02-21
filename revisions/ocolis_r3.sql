BEGIN;

-- ALTER TABLE package
    -- ADD UNIQUE(serial_number);

-- on impose d'avoir un numéro unique de référence pour chaque colis
ALTER TABLE package
    ADD CONSTRAINT serial_number_unique -- on lui donne un nom pour pouvoir la retrouver facilement 
    UNIQUE (serial_number);
COMMIT;