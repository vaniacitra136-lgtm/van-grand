-- ============================================================
-- FILE 06: Tabel — Tipe Kamar
-- ============================================================

CREATE TABLE rooms (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    hotel_id        INT NOT NULL,
    type_name       VARCHAR(150) NOT NULL,
    size            VARCHAR(20) NOT NULL,
    bed             VARCHAR(100) NOT NULL,
    price           INT NOT NULL,
    original_price  INT NULL,
    discount        TINYINT NULL,
    has_breakfast   BOOLEAN DEFAULT FALSE,
    is_cancellable  BOOLEAN DEFAULT FALSE,
    is_smoking      BOOLEAN DEFAULT FALSE,
    is_active       BOOLEAN DEFAULT TRUE,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_room_hotel FOREIGN KEY (hotel_id) REFERENCES hotels(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO rooms (hotel_id, type_name, size, bed, price, original_price, discount, has_breakfast, is_cancellable, is_smoking) VALUES
-- The Grand Nusantara (1)
(1,  'Deluxe King',           '36 m²',  '1 King Bed',             1850000,  2300000,  20, TRUE,  TRUE,  FALSE),
(1,  'Executive Suite',       '54 m²',  '1 King Bed + Sofa Bed',  3200000,  4000000,  20, TRUE,  TRUE,  FALSE),
(1,  'Presidential Suite',    '120 m²', '2 King Beds',            8500000,  10000000, 15, TRUE,  TRUE,  TRUE),
-- Savana Resort & Spa (2)
(2,  'Garden Villa',          '65 m²',  '1 King Bed',             2500000,  3100000,  19, TRUE,  TRUE,  FALSE),
(2,  'Pool Villa',            '85 m²',  '1 King Bed',             4200000,  5000000,  16, TRUE,  TRUE,  FALSE),
(2,  'Honeymoon Suite',       '100 m²', '1 King Bed + Bathtub',   5800000,  7000000,  17, TRUE,  FALSE, FALSE),
-- Aston Braga Bandung (3)
(3,  'Superior Twin',         '24 m²',  '2 Single Beds',          780000,   950000,  18, TRUE,  FALSE, FALSE),
(3,  'Deluxe King',           '30 m²',  '1 King Bed',             950000,   1100000, 14, TRUE,  TRUE,  FALSE),
(3,  'Executive Suite',       '48 m²',  '1 King Bed',             1500000,  1800000, 17, TRUE,  TRUE,  TRUE),
-- Keraton Yogyakarta (4)
(4,  'Standard Double',       '22 m²',  '1 Double Bed',           920000,   1100000, 16, TRUE,  TRUE,  FALSE),
(4,  'Joglo Suite',           '45 m²',  '1 King Bed',             1800000,  2200000, 18, TRUE,  TRUE,  FALSE),
-- Majapahit Surabaya (5)
(5,  'Heritage Room',         '32 m²',  '1 Queen Bed',            1600000,  1950000, 18, TRUE,  TRUE,  FALSE),
(5,  'Grand Deluxe',          '42 m²',  '1 King Bed',             2400000,  2800000, 14, TRUE,  TRUE,  FALSE),
(5,  'Presidential Wing',     '95 m²',  '1 King Bed',             6500000,  7500000, 13, TRUE,  TRUE,  TRUE),
-- Puncak Highland Resort (6)
(6,  'Standard Room',         '20 m²',  '1 Double Bed',           650000,   800000,  19, TRUE,  FALSE, FALSE),
(6,  'Family Suite',          '40 m²',  '1 King + 2 Single',      1100000,  1350000, 19, TRUE,  TRUE,  FALSE),
(6,  'Cottage',               '55 m²',  '1 King Bed',             1500000,  1800000, 17, TRUE,  TRUE,  TRUE),
-- Ayana Sunset Villa (7)
(7,  'Ocean View Room',       '40 m²',  '1 King Bed',             3200000,  4000000, 20, TRUE,  TRUE,  FALSE),
(7,  '1-Bedroom Pool Villa',  '90 m²',  '1 King Bed',             5500000,  6500000, 15, TRUE,  TRUE,  FALSE),
(7,  '2-Bedroom Beach Villa', '160 m²', '2 King Beds',            9500000,  12000000, 21, TRUE,  TRUE,  FALSE),
-- Java Heritage Hotel (8)
(8,  'Standard Room',         '18 m²',  '1 Double Bed',           420000,   520000,  19, TRUE,  FALSE, FALSE),
(8,  'Superior Room',         '24 m²',  '1 Queen Bed',            580000,   680000,  15, TRUE,  TRUE,  FALSE),
-- Batu Secret Garden (9)
(9,  'Garden View Room',      '22 m²',  '1 Double Bed',           720000,   880000,  18, TRUE,  TRUE,  FALSE),
(9,  'Family Room',           '36 m²',  '1 King + 1 Single',      1050000,  1250000, 16, TRUE,  TRUE,  FALSE),
(9,  'Treehouse Suite',       '45 m²',  '1 King Bed',             1600000,  1900000, 16, TRUE,  TRUE,  FALSE),
-- Kempinski Jakarta (10)
(10, 'Premier Room',          '38 m²',  '1 King Bed',             2800000,  3500000, 20, TRUE,  TRUE,  FALSE),
(10, 'Executive Suite',       '65 m²',  '1 King Bed',             4800000,  5800000, 17, TRUE,  TRUE,  FALSE),
(10, 'Royal Suite',           '150 m²', '1 King Bed + Living Room', 15000000, 18000000, 17, TRUE, TRUE, TRUE),
-- Tugu Malang Hotel (11)
(11, 'Antique Room',          '20 m²',  '1 Double Bed',           580000,   700000,  17, TRUE,  FALSE, FALSE),
(11, 'Heritage Suite',        '40 m²',  '1 King Bed',             980000,   1200000, 18, TRUE,  TRUE,  FALSE),
-- Anvaya Beach Resort (12)
(12, 'Garden View Room',      '30 m²',  '1 King Bed',             1350000,  1650000, 18, TRUE,  TRUE,  FALSE),
(12, 'Ocean View Room',       '34 m²',  '1 King Bed',             1750000,  2100000, 17, TRUE,  TRUE,  FALSE),
(12, 'Beach Front Suite',     '55 m²',  '1 King Bed',             2800000,  3400000, 18, TRUE,  TRUE,  FALSE);