CREATE PROCEDURE sp_create_booking(
    IN p_guest_id       INT,
    IN p_hotel_id       INT,
    IN p_room_id        INT,
    IN p_check_in       DATE,
    IN p_check_out      DATE,
    IN p_adults         TINYINT,
    IN p_children       TINYINT,
    IN p_room_count     TINYINT,
    IN p_notes          TEXT,
    IN p_payment_method INT,
    OUT p_booking_code  VARCHAR(20),
    OUT p_total_amount  INT
)
BEGIN
    DECLARE v_nights   INT;
    DECLARE v_price    INT;
    DECLARE v_subtotal INT;
    DECLARE v_tax      INT;
    DECLARE v_total    INT;
    DECLARE v_code     VARCHAR(20);

    -- Validasi tanggal
    SET v_nights = DATEDIFF(p_check_out, p_check_in);
    IF v_nights < 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Check-out harus setelah check-in';
    END IF;

    -- Validasi kamar
    SELECT price INTO v_price FROM rooms WHERE id = p_room_id AND is_active = TRUE;
    IF v_price IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Kamar tidak ditemukan atau tidak aktif';
    END IF;

    -- Hitung total
    SET v_subtotal = v_price * v_nights * p_room_count;
    SET v_tax      = ROUND(v_subtotal * 0.11);
    SET v_total    = v_subtotal + v_tax;

    -- Generate kode booking unik
    REPEAT
        SET v_code = CONCAT('VGS-', UPPER(SUBSTRING(MD5(RAND()), 1, 8)));
    UNTIL NOT EXISTS (SELECT 1 FROM bookings WHERE booking_code = v_code) END REPEAT;

    -- Insert booking
    INSERT INTO bookings (booking_code, guest_id, hotel_id, room_id, check_in, check_out, nights, adults, children, room_count, subtotal, tax, total, notes, status)
    VALUES (v_code, p_guest_id, p_hotel_id, p_room_id, p_check_in, p_check_out, v_nights, p_adults, p_children, p_room_count, v_subtotal, v_tax, v_total, p_notes, 'confirmed');

    -- Insert payment
    INSERT INTO booking_payments (booking_id, payment_method_id, amount, status)
    VALUES (LAST_INSERT_ID(), p_payment_method, v_total, 'pending');

    -- Return output
    SET p_booking_code = v_code;
    SET p_total_amount = v_total;
END //


-- Prosedur: Cari hotel dengan filter dinamis
CREATE PROCEDURE sp_search_hotels(
    IN p_city_id      INT,
    IN p_max_price    INT,
    IN p_min_stars    TINYINT,
    IN p_min_rating   DECIMAL(2,1),
    IN p_sort_by      VARCHAR(20)
)
BEGIN
    SELECT
        h.id, h.name, h.location, c.name AS city,
        h.stars, h.rating, h.reviews,
        h.price_from, h.original_price, h.discount,
        h.image, h.description
    FROM hotels h
    JOIN cities c ON h.city_id = c.id
    WHERE h.is_active = TRUE
        AND (p_city_id IS NULL OR h.city_id = p_city_id)
        AND (p_max_price IS NULL OR h.price_from <= p_max_price)
        AND (p_min_stars IS NULL OR h.stars >= p_min_stars)
        AND (p_min_rating IS NULL OR h.rating >= p_min_rating)
    ORDER BY
        CASE
            WHEN p_sort_by = 'price_low'  THEN h.price_from
            WHEN p_sort_by = 'price_high' THEN -h.price_from
            WHEN p_sort_by = 'rating'     THEN -h.rating
            WHEN p_sort_by = 'stars'      THEN -(h.stars * 10 + h.rating)
            ELSE h.rating DESC
        END;
END //

DELIMITER ;