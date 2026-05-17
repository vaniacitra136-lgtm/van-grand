-- ============================================================
-- FILE 04: Tabel Referensi — Tags / Label
-- ============================================================

CREATE TABLE tags (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL UNIQUE,
    color_type  ENUM('accent', 'gold', 'default') DEFAULT 'default',
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

INSERT INTO tags (name, color_type) VALUES
    ('Breakfast Included',    'accent'),
    ('Free Cancellation',     'accent'),
    ('Best Seller',           'gold'),
    ('Cultural Experience',   'accent'),
    ('Heritage',              'accent'),
    ('Mountain View',         'accent'),
    ('Private Pool',          'accent'),
    ('Top Rated',             'accent'),
    ('Budget Friendly',       'accent'),
    ('Family Friendly',       'accent'),
    ('Beach Front',           'accent'),
    ('Luxury',                'gold'),
    ('Unique Stay',           'accent');
