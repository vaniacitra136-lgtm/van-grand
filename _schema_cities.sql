CREATE TABLE cities (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    icon        VARCHAR(50) NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

INSERT INTO cities (name, icon) VALUES
    ('Jakarta',      'fa-building'),
    ('Bali',         'fa-umbrella-beach'),
    ('Bandung',      'fa-mountain-sun'),
    ('Yogyakarta',   'fa-landmark'),
    ('Surabaya',     'fa-city'),
    ('Malang',       'fa-leaf');