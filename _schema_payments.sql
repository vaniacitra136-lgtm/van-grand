CREATE TABLE payment_methods (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL UNIQUE,
    icon        VARCHAR(50) NOT NULL,
    category    ENUM('bank_transfer', 'e_wallet', 'card', 'hotel') NOT NULL,
    is_active   BOOLEAN DEFAULT TRUE,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

INSERT INTO payment_methods (name, icon, category) VALUES
('Transfer Bank BCA',      'fa-building-columns', 'bank_transfer'),
('Transfer Bank Mandiri',  'fa-building-columns', 'bank_transfer'),
('Transfer Bank BNI',      'fa-building-columns', 'bank_transfer'),
('GoPay',                   'fa-wallet',           'e_wallet'),
('OVO',                     'fa-wallet',           'e_wallet'),
('DANA',                    'fa-wallet',           'e_wallet'),
('ShopeePay',               'fa-wallet',           'e_wallet'),
('Kartu Kredit/Debit',     'fa-credit-card',      'card'),
('Bayar di Hotel',         'fa-hotel',            'hotel');


-- Record pembayaran per booking
CREATE TABLE booking_payments (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    booking_id          INT NOT NULL UNIQUE,
    payment_method_id   INT NOT NULL,
    amount              INT NOT NULL,
    paid_at             TIMESTAMP NULL,
    status              ENUM('pending', 'paid', 'failed', 'refunded') DEFAULT 'pending',
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_bp_booking FOREIGN KEY (booking_id)         REFERENCES bookings(id)         ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_bp_method  FOREIGN KEY (payment_method_id)  REFERENCES payment_methods(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO booking_payments (booking_id, payment_method_id, amount, paid_at, status) VALUES
(1, 1, 8325000,  '2025-07-28 14:30:00', 'paid'),
(2, 4, 10656000, '2025-07-14 09:15:00', 'paid'),
(3, 7, 4107000,  NULL,                   'pending'),
(4, 8, 6216000,  '2025-07-19 16:45:00', 'paid'),
(5, 2, 4884000,  '2025-08-04 11:00:00', 'paid'),
(6, 9, 3996000,  '2025-10-01 08:00:00', 'paid'),
(7, 5, 4495500,  '2025-08-11 20:30:00', 'paid'),
(8, 3, 2331000,  NULL,                   'refunded');