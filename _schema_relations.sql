-- ============================================================
-- FILE 07: Tabel Relasi — Many-to-Many
-- ============================================================

-- Hotel ↔ Fasilitas
CREATE TABLE hotel_amenities (
    hotel_id    INT NOT NULL,
    amenity_id  INT NOT NULL,
    PRIMARY KEY (hotel_id, amenity_id),
    CONSTRAINT fk_ha_hotel   FOREIGN KEY (hotel_id)   REFERENCES hotels(id)    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_ha_amenity FOREIGN KEY (amenity_id) REFERENCES amenities(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- The Grand Nusantara (1)
INSERT INTO hotel_amenities (hotel_id, amenity_id) VALUES
(1,1),(1,2),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10);
-- Savana Resort & Spa (2)
INSERT INTO hotel_amenities (hotel_id, amenity_id) VALUES
(2,1),(2,3),(2,5),(2,6),(2,7),(2,8),(2,9),(2,11),(2,12);
-- Aston Braga Bandung (3)
INSERT INTO hotel_amenities (hotel_id, amenity_id) VALUES
(3,1),(3,2),(3,7),(3,8),(3,9),(3,13),(3,14);
-- Keraton Yogyakarta (4)
INSERT INTO hotel_amenities (hotel_id, amenity_id) VALUES
(4,1),(4,2),(4,7),(4,8),(4,9),(4,5),(4,30),(4,29);
-- Majapahit Surabaya (5)
INSERT INTO hotel_amenities (hotel_id, amenity_id) VALUES
(5,1),(5,2),(5,5),(5,6),(5,7),(5,8),(5,9),(5,15),(5,16);
-- Puncak Highland Resort (6)
INSERT INTO hotel_amenities (hotel_id, amenity_id) VALUES
(6,1),(6,2),(6,7),(6,8),(6,9),(6,17),(6,18),(6,19);
-- Ayana Sunset Villa (7)
INSERT INTO hotel_amenities (hotel_id, amenity_id) VALUES
(7,1),(7,4),(7,5),(7,6),(7,7),(7,8),(7,9),(7,22),(7,23),(7,24);
-- Java Heritage Hotel (8)
INSERT INTO hotel_amenities (hotel_id, amenity_id) VALUES
(8,1),(8,7),(8,8),(8,9),(8,25),(8,26);
-- Batu Secret Garden (9)
INSERT INTO hotel_amenities (hotel_id, amenity_id) VALUES
(9,1),(9,2),(9,7),(9,8),(9,9),(9,17),(9,20),(9,21);
-- Kempinski Jakarta (10)
INSERT INTO hotel_amenities (hotel_id, amenity_id) VALUES
(10,1),(10,2),(10,5),(10,6),(10,7),(10,8),(10,9),(10,31),(10,32),(10,28);
-- Tugu Malang Hotel (11)
INSERT INTO hotel_amenities (hotel_id, amenity_id) VALUES
(11,1),(11,7),(11,8),(11,9),(11,5),(11,27),(11,28);
-- Anvaya Beach Resort (12)
INSERT INTO hotel_amenities (hotel_id, amenity_id) VALUES
(12,1),(12,2),(12,5),(12,6),(12,7),(12,8),(12,9),(12,33),(12,34);


-- Hotel ↔ Tags
CREATE TABLE hotel_tags (
    hotel_id    INT NOT NULL,
    tag_id      INT NOT NULL,
    PRIMARY KEY (hotel_id, tag_id),
    CONSTRAINT fk_ht_hotel FOREIGN KEY (hotel_id) REFERENCES hotels(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_ht_tag   FOREIGN KEY (tag_id)   REFERENCES tags(id)   ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO hotel_tags (hotel_id, tag_id) VALUES
(1,1),(1,2),
(2,1),(2,2),(2,3),
(3,1),
(4,1),(4,2),(4,4),
(5,1),(5,2),(5,5),
(6,1),(6,6),
(7,1),(7,2),(7,7),(7,8),
(8,1),(8,9),
(9,1),(9,2),(9,10),
(10,1),(10,2),(10,12),
(11,1),(11,4),(11,13),
(12,1),(12,2),(12,11);