BEGIN;

-- on ajoute 3 champs de type TIMESTAMPTZ pour la traçabilité de nos colis
-- on souhaite savoir :
-- - quand ils seront pris en charge (à indiquer à la création)
-- - quand ils partiront en livraison (à indiquer après coup)
-- - quand ils seront effectivement livrés (à indiquer après coup)

ALTER TABLE package
    ADD COLUMN request_time TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    ADD COLUMN expedition_time TIMESTAMPTZ, 
    ADD COLUMN delivered_time TIMESTAMPTZ;

-- pour les 2 dernières colonnes on aurait pu ajouter le mot clé NULL pour indiquer l'absence de valeur
-- toutefois, c'est le cas par default, on n'est pas obligé d'indiquer cette info

COMMIT;