-- ============================================================
-- FILE 05: Tabel Utama — Hotel
-- ============================================================

CREATE TABLE hotels (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(200) NOT NULL,
    location        VARCHAR(300) NOT NULL,
    city_id         INT NOT NULL,
    stars           TINYINT NOT NULL CHECK (stars BETWEEN 1 AND 5),
    rating          DECIMAL(2,1) NOT NULL CHECK (rating BETWEEN 0 AND 10),
    reviews         INT NOT NULL DEFAULT 0,
    price_from      INT NOT NULL,
    original_price  INT NULL,
    discount        TINYINT NULL,
    image           VARCHAR(500) NOT NULL,
    description     TEXT NOT NULL,
    is_active       BOOLEAN DEFAULT TRUE,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_hotel_city FOREIGN KEY (city_id) REFERENCES cities(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO hotels (id, name, location, city_id, stars, rating, reviews, price_from, original_price, discount, image, description) VALUES
(1,  'The Grand Nusantara',       'Jakarta Selatan, Jakarta',  1, 5, 9.3, 3847,  1850000, 2300000, 20, 'https://picsum.photos/seed/grandnus/600/400',    'Hotel bintang 5 premium di jantung Jakarta Selatan dengan pemandangan kota yang menakjubkan, fasilitas spa kelas dunia, dan restoran fine-dining dengan chef berpengalaman internasional.'),
(2,  'Savana Resort & Spa',       'Ubud, Bali',                2, 5, 9.5, 5120,  2500000, 3100000, 19, 'https://picsum.photos/seed/savana/600/400',      'Resor mewah yang tersembunyi di antara sawah hijau Ubud. Nikmati ketenangan alam Bali dengan sentuhan kemewahan modern, infinity pool menghadap lembah, dan perawatan spa tradisional Bali.'),
(3,  'Aston Braga Bandung',       'Jl. Braga, Bandung',        3, 4, 8.8, 2156,  780000,  950000,  18, 'https://picsum.photos/seed/astonbraga/600/400',  'Hotel modern di kawasan heritage Braga, tepat di pusat kota Bandung. Akses mudah ke factory outlet, kafe ternama, dan destinasi wisata alam Lembang.'),
(4,  'Keraton Yogyakarta',        'Malioboro, Yogyakarta',     4, 4, 9.0, 1890,  920000,  1100000, 16, 'https://picsum.photos/seed/keratonyg/600/400',   'Hotel bertema keraton yang elegan di jantung Yogyakarta, berjalan kaki ke Malioboro. Rasakan kemegahan budaya Jawa dengan sentuhan hospitality modern.'),
(5,  'Majapahit Surabaya',        'Tunjungan, Surabaya',       5, 5, 9.1, 2780,  1600000, 1950000, 18, 'https://picsum.photos/seed/majapahit/600/400',   'Hotel bersejarah dengan arsitektur kolonial yang megah, telah melayani tamu sejak era 1910. Renovasi modern menjaga pesona klasik sambil menawarkan kenyamanan masa kini.'),
(6,  'Puncak Highland Resort',    'Puncak, Bogor',             3, 4, 8.6, 1450,  650000,  800000,  19, 'https://picsum.photos/seed/puncakhr/600/400',    'Resor pegunungan dengan udara segar dan pemandangan Gunung Gede-Pangrango yang menakjubkan. Ideal untuk liburan keluarga dan wisata alam.'),
(7,  'Ayana Sunset Villa',        'Jimbaran, Bali',            2, 5, 9.4, 6200,  3200000, 4000000, 20, 'https://picsum.photos/seed/ayanavilla/600/400',  'Villa mewah di tepi tebing Jimbaran dengan pemandangan sunset ikonik Bali. Setiap villa memiliki kolam renang pribadi dan butler pribadi 24 jam.'),
(8,  'Java Heritage Hotel',       'Kota Lama, Semarang',       5, 3, 8.3, 980,   420000,  520000,  19, 'https://picsum.photos/seed/javaheritage/600/400','Hotel butik di kawasan Kota Lama Semarang dengan arsitektur bergaya kolonial. Harga terjangkau dengan lokasi strategis dekat tempat wisata bersejarah.'),
(9,  'Batu Secret Garden',        'Batu, Malang',              6, 4, 8.9, 1650,  720000,  880000,  18, 'https://picsum.photos/seed/batugarden/600/400',  'Resor keluarga terbaik di Batu dengan taman-taman indah, kolam renang anak, dan dekat dengan Jatim Park, Museum Angkut, dan wisata alam Batu.'),
(10, 'Kempinski Jakarta',         'Thamrin, Jakarta',          1, 5, 9.4, 4200,  2800000, 3500000, 20, 'https://picsum.photos/seed/kempinski/600/400',   'Salah satu hotel terbaik di Indonesia, terletak di jantung bisnis Jakarta. Pelayanan kelas dunia dengan standar Kempinski, restoran Michelin-star, dan pemandangan Monas yang memukau.'),
(11, 'Tugu Malang Hotel',         'Kota Tua, Malang',          6, 4, 8.7, 1120,  580000,  700000,  17, 'https://picsum.photos/seed/tugumalang/600/400',   'Hotel butik unik dengan koleksi antik dan seni bernilai tinggi. Setiap sudut menyimpan cerita tentang budaya Jawa dan sejarah Malang yang kaya.'),
(12, 'Anvaya Beach Resort',       'Kuta, Bali',                2, 4, 8.9, 3400,  1350000, 1650000, 18, 'https://picsum.photos/seed/anvaya/600/400',     'Resor tepi pantai di Kuta dengan akses langsung ke pantai. Kolam renang pantai terpanjang di Bali, restoran seafood, dan program anak yang menyenangkan.');

-- ============================================================
-- FILE 05 (Lanjutan): Tabel Gambar Hotel
-- ============================================================

CREATE TABLE hotel_images (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    hotel_id    INT NOT NULL,
    image_url   VARCHAR(500) NOT NULL,
    sort_order  TINYINT DEFAULT 0,
    CONSTRAINT fk_img_hotel FOREIGN KEY (hotel_id) REFERENCES hotels(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO hotel_images (hotel_id, image_url, sort_order) VALUES
(1,  'https://picsum.photos/seed/grandnus/800/500',    1),
(1,  'https://picsum.photos/seed/grandnus2/800/500',   2),
(1,  'https://picsum.photos/seed/grandnus3/800/500',   3),
(1,  'https://picsum.photos/seed/grandnus4/800/500',   4),
(2,  'https://picsum.photos/seed/savana/800/500',      1),
(2,  'https://picsum.photos/seed/savana2/800/500',     2),
(2,  'https://picsum.photos/seed/savana3/800/500',     3),
(2,  'https://picsum.photos/seed/savana4/800/500',     4),
(3,  'https://picsum.photos/seed/astonbraga/800/500',  1),
(3,  'https://picsum.photos/seed/astonbraga2/800/500', 2),
(3,  'https://picsum.photos/seed/astonbraga3/800/500', 3),
(3,  'https://picsum.photos/seed/astonbraga4/800/500', 4),
(4,  'https://picsum.photos/seed/keratonyg/800/500',   1),
(4,  'https://picsum.photos/seed/keratonyg2/800/500',  2),
(4,  'https://picsum.photos/seed/keratonyg3/800/500',  3),
(4,  'https://picsum.photos/seed/keratonyg4/800/500',  4),
(5,  'https://picsum.photos/seed/majapahit/800/500',   1),
(5,  'https://picsum.photos/seed/majapahit2/800/500',  2),
(5,  'https://picsum.photos/seed/majapahit3/800/500',  3),
(5,  'https://picsum.photos/seed/majapahit4/800/500',  4),
(6,  'https://picsum.photos/seed/puncakhr/800/500',    1),
(6,  'https://picsum.photos/seed/puncakhr2/800/500',   2),
(6,  'https://picsum.photos/seed/puncakhr3/800/500',   3),
(6,  'https://picsum.photos/seed/puncakhr4/800/500',   4),
(7,  'https://picsum.photos/seed/ayanavilla/800/500',  1),
(7,  'https://picsum.photos/seed/ayanavilla2/800/500', 2),
(7,  'https://picsum.photos/seed/ayanavilla3/800/500', 3),
(7,  'https://picsum.photos/seed/ayanavilla4/800/500', 4),
(8,  'https://picsum.photos/seed/javaheritage/800/500',1),
(8,  'https://picsum.photos/seed/javaheritage2/800/500',2),
(8,  'https://picsum.photos/seed/javaheritage3/800/500',3),
(8,  'https://picsum.photos/seed/javaheritage4/800/500',4),
(9,  'https://picsum.photos/seed/batugarden/800/500',  1),
(9,  'https://picsum.photos/seed/batugarden2/800/500', 2),
(9,  'https://picsum.photos/seed/batugarden3/800/500', 3),
(9,  'https://picsum.photos/seed/batugarden4/800/500', 4),
(10, 'https://picsum.photos/seed/kempinski/800/500',   1),
(10, 'https://picsum.photos/seed/kempinski2/800/500',  2),
(10, 'https://picsum.photos/seed/kempinski3/800/500',  3),
(10, 'https://picsum.photos/seed/kempinski4/800/500',  4),
(11, 'https://picsum.photos/seed/tugumalang/800/500',  1),
(11, 'https://picsum.photos/seed/tugumalang2/800/500', 2),
(11, 'https://picsum.photos/seed/tugumalang3/800/500', 3),
(11, 'https://picsum.photos/seed/tugumalang4/800/500', 4),
(12, 'https://picsum.photos/seed/anvaya/800/500',     1),
(12, 'https://picsum.photos/seed/anvaya2/800/500',    2),
(12, 'https://picsum.photos/seed/anvaya3/800/500',    3),
(12, 'https://picsum.photos/seed/anvaya4/800/500',    4);