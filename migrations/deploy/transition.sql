-- Deploy ocolis:transition to pg

BEGIN;

-- revision r1
CREATE TABLE place (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    reference text NOT NULL UNIQUE,
    name text NOT NULL,
    address text NOT NULL,
    additional text,
    postal_code int NOT NULL,
    city text NOT NULL
);

CREATE TABLE package (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    serial_number int NOT NULL,
    content_description text NOT NULL,
    weight float NOT NULL, -- en kg, avec précision au gramme près
    volume int NOT NULL, -- en centimètres cubes
    worth int NOT NULL, -- c'est approximatif à l'euro près
    sender_id int REFERENCES place(id),
    recipient_id int REFERENCES place(id)
);

-- révision r2
ALTER TABLE package
    ALTER COLUMN serial_number TYPE TEXT;

-- révision r3
ALTER TABLE package
    ADD CONSTRAINT serial_number_unique
    UNIQUE (serial_number);

-- révision r4
ALTER TABLE package
    RENAME COLUMN volume TO height;

ALTER TABLE package
    ADD COLUMN width INT NOT NULL DEFAULT 1,
    ADD COLUMN depth INT NOT NULL DEFAULT 1;

ALTER TABLE package
    ALTER COLUMN width DROP DEFAULT,
    ALTER COLUMN depth DROP DEFAULT;

-- révision r5
ALTER TABLE package
    ADD COLUMN request_time TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    ADD COLUMN expedition_time TIMESTAMPTZ,
    ADD COLUMN delivered_time TIMESTAMPTZ;

COMMIT;
