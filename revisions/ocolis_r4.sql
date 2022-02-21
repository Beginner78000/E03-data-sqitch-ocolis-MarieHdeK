BEGIN;

-- On remplace la colonne volume (qui ne donne pas d'info utilisable sur le colis)
-- par 3 nouvelles colonnes pour stocker les dimensions du colis
-- on pourra retrouver l'info du volume par le calcul : width + height + depth

-- modif de la colonne existante volume, pour l'adapter à la nouvelle structure
ALTER TABLE package
    RENAME COLUMN volume TO height;


-- ajout de 2 colonnes supplémentaire pour stocker les dimensions manquantes
-- on rend les champs obligatoires pour les colis futurs, on simule une valeur pour les enregistrements existants
-- ainsi l'info du volume n'est pas perdu même si les dimensions sont fausses
ALTER TABLE package
    ADD COLUMN width INT NOT NULL DEFAULT 1,
    ADD COLUMN depth INT NOT NULL DEFAULT 1;

-- cependant, pour les colis futurs, on souhaite imposer au user de saisir les dimensions
-- en laissant la valeur par défaut indiquée au dessus, on "désactive" cette obligation
-- on supprime donc cette valuer fictive pour les enregestriments à suivre

ALTER TABLE package
    ALTER COLUMN width DROP DEFAULT,
    ALTER COLUMN depth DROP DEFAULT;
    
COMMIT;