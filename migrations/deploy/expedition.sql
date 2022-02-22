-- Deploy ocolis:expedition to pg

BEGIN;

-- ajout de la nouvelle table
CREATE TABLE expedition (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    driver_name TEXT NOT NULL,
    vehicle_plate TEXT NOT NULL,
    starting_time TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    ending_time TIMESTAMPTZ
);

-- mise en relation avec la table package
ALTER TABLE package
    ADD COLUMN expedition_id INT REFERENCES expedition(id);

-- seeding de la table expedition à partir des infos existantes dans package
-- pour "nourrir" ce seed, on utilise des data fictives pour les champs obligatoires  pour lesquels on n'a pas d'info (driver_name, vehicle_plate) et on conserve de façon unique la seule info dispo, la date d'expedition
INSERT INTO expedition (driver_name, vehicle_plate, starting_time)
	SELECT DISTINCT 'inconnu', 'inconnu', expedition_time FROM package
    WHERE expedition_time IS NOT NULL;

-- on a toujours l'info de expedition_time dans la table package, on s'en sert pour faire le lien avec le starting_time de la table expedition afin de seeder le champ expedition_id dans package
UPDATE package SET expedition_id=(
	select id FROM expedition WHERE starting_time=package.expedition_time
);

-- il nous reste à supprimer l'information redondante dans la BDD, le champ expedtion_time de package
ALTER TABLE package
    DROP COLUMN expedition_time;

COMMIT;
