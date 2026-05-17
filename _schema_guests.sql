CREATE TABLE guests (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    full_name   VARCHAR(200) NOT NULL,
    email       VARCHAR(200) NOT NULL UNIQUE,
    phone       VARCHAR(20) NOT NULL,
    is_member   BOOLEAN DEFAULT FALSE,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

INSERT INTO guests (full_name, email, phone, is_member) VALUES
('Budi Santoso',         'budi.santoso@email.com',    '081234567890', TRUE),
('Siti Rahayu',          'siti.rahayu@email.com',     '082345678901', TRUE),
('Ahmad Fauzi',          'ahmad.fauzi@email.com',     '083456789012', FALSE),
('Diana Putri',          'diana.putri@email.com',     '084567890123', TRUE),
('Rizky Pratama',        'rizky.pratama@email.com',   '085678901234', FALSE),
('Maya Anggraeni',       'maya.anggraeni@email.com',  '086789012345', TRUE),
('Hendra Wijaya',        'hendra.wijaya@email.com',   '087890123456', FALSE),
('Rina Wulandari',       'rina.wulandari@email.com',  '088901234567', TRUE);