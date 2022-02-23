-- -- Deploy ocolis:domains to pg

BEGIN;

-- vehicule_plate

CREATE DOMAIN plate AS TEXT
CHECK(
    -- plaque d'immatriculation moderne et française
    -- lettres à proscrire : I O U et les combinaisons WW et SS
    -- pour les chiffres, la seule combinaison interdite est 000
    VALUE ~ '^inconnu$|^(?!WW|SS)[A-HJ-NP-TV-Z]{2}-(?!000)\d{3}-[A-HJ-NP-TV-Z]{2}(?<!SS)$'
);

ALTER TABLE expedition
    ALTER COLUMN vehicle_plate TYPE plate;


CREATE DOMAIN code_postal AS TEXT
CHECK(
-- règle complète : (58180|34280|20600|20620)|^(?!00|96|99)(?!20[45789])\d{5}(?<![12]80)$

-- codes postaux très particuliers
VALUE ~ '^(58180|34280|20600|20620|20300)$'
OR
(
    -- règle générale
    VALUE ~ '^(?!00|96|99)\d{5}$'

    -- exceptions générales
    AND
    VALUE ~ '^\d{5}(?<![12]80)$'


    -- on ajoute la corse
    AND
    VALUE ~ '^(?!20[3-9])\d{5}$'

    -- on pourrait ajouter la Bretagne, les DOM, ...
)
);

ALTER TABLE place
    ALTER COLUMN postal_code TYPE code_postal;

COMMIT;


