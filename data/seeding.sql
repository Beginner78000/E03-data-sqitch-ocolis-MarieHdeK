BEGIN;

INSERT INTO package (serial_number, content_description, weight, height, worth, width, depth) VALUES
('12345', 'table de torture', 15.325, 2000, 250, 1, 1),
('12346', 'costume en cuir', 1.357, 450, 77, 1, 1),
('12347', 'Lot fouet/martinet à clous en promo', 0.827, 150, 38, 1, 1);


COMMIT;