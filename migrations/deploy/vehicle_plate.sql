-- Deploy ocolis:vehicle_plate to pg

BEGIN;

-- CREATE DOMAIN nom [AS] type_donnee
--     [ COLLATE collation ]
--     [ DEFAULT expression ]
--     [ contrainte [ ... ] ]

-- où contrainte est :

-- [ CONSTRAINT nom_contrainte ]
-- { NOT NULL | NULL | CHECK (expression) }

CREATE DOMAIN immat AS TEXT NOT NULL
CHECK(
    VALUE ~ '^[A-Z]{1,2}-[0-9]{1,3}-[A-Z]{1,2}$)';

ALTER TABLE expedition
    ALTER COLUMN vehicle_plate TYPE immat;

-- code postale
CREATE DOMAIN zip_code AS INT NOT NULL
CHECK(
   VALUE ~ '^((0[1-9])|([1-8][0-9])|(9[0-8])|(2A)|(2B))[0-9]{3}$'
); 

ALTER TABLE place
    ALTER COLUMN postal_code TYPE zip_code;

COMMIT;
