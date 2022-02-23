-- -- Revert ocolis:vehicle_plate from pg

BEGIN;

-- à la création, le code postal était noté de type int
-- ce n'était pas très cohérent puisque :
-- - on ne souhaite pas faire d'opérations mathématiques sur ce champ
-- - on risque de perdre de l'information si le code postal commence par 0

ALTER TABLE place
    ALTER COLUMN postal_code TYPE TEXT;

DROP DOMAIN code_postal;


ALTER TABLE expedition
    ALTER COLUMN vehicle_plate TYPE TEXT;

DROP DOMAIN plate;

COMMIT;

