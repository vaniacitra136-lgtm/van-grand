-- ============================================================
-- FILE 03: Tabel Referensi — Fasilitas
-- ============================================================

CREATE TABLE amenities (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL UNIQUE,
    icon        VARCHAR(50) NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

INSERT INTO amenities (name, icon) VALUES
    ('WiFi',                   'fa-wifi'),
    ('Kolam Renang',           'fa-person-swimming'),
    ('Kolam Renang Infinity',  'fa-water'),
    ('Private Pool',           'fa-water'),
    ('Spa',                    'fa-spa'),
    ('Gym',                    'fa-dumbbell'),
    ('Restoran',               'fa-utensils'),
    ('Parkir',                 'fa-square-parking'),
    ('AC',                     'fa-snowflake'),
    ('Resepsionis 24 Jam',     'fa-bell-concierge'),
    ('Shuttle Gratis',         'fa-van-shuttle'),
    ('Yoga',                   'fa-om'),
    ('Rooftop Bar',            'fa-champagne-glasses'),
    ('Meeting Room',           'fa-people-group'),
    ('Tennis Court',           'fa-table-tennis-paddle-ball'),
    ('Business Center',        'fa-briefcase'),
    ('Taman',                  'fa-tree'),
    ('API Ungg',               'fa-fire'),
    ('BBQ Area',               'fa-fire-burner'),
    ('Playground',             'fa-children'),
    ('Kuda Tunggang',          'fa-horse'),
    ('Beach Access',           'fa-umbrella-beach'),
    ('Bar',                    'fa-martini-glass'),
    ('Butler',                 'fa-user-tie'),
    ('Laundry',                'fa-shirt'),
    ('Rental Mobil',           'fa-car'),
    ('Gallery',                'fa-images'),
    ('Antique Collection',     'fa-vase'),
    ('Cultural Show',          'fa-masks-theater'),
    ('Kereta Kuda',            'fa-horse'),
    ('Helipad',                'fa-helicopter'),
    ('Concierge',              'fa-bell-concierge'),
    ('Lounge',                 'fa-couch'),
    ('Beach Club',             'fa-umbrella-beach'),
    ('Kids Club',              'fa-child-reaching');