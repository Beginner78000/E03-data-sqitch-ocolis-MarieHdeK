-- Revert ocolis:expedition from pg

BEGIN;

-- on remet en place le champ expedition_time
ALTER TABLE package
    ADD COLUMN expedition_time TIMESTAMPTZ;

-- on utilise les infos de expedition.starting_time pour seeder ce champ
-- pour faire le lien, on dispose de l'id de l'expedition qui est également stockée comme clé étrangère dans package (package.expedition_id)
UPDATE package SET expedition_time=(
    SELECT starting_time FROM expedition WHERE id=package.expedition_id
);

-- on supprime le champ expedition_id devenu inutile
ALTER TABLE package
DROP COLUMN expedition_id;

-- on supprime la table expedition
DROP TABLE expedition;

COMMIT;
