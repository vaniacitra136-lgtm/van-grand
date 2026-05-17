CREATE VIEW v_hotel_summary AS
SELECT
    h.id,
    h.name,
    h.location,
    c.name AS city_name,
    h.stars,
    h.rating,
    h.reviews,
    h.price_from,
    h.original_price,
    h.discount,
    h.image,
    h.description,
    (SELECT COUNT(*) FROM rooms r WHERE r.hotel_id = h.id AND r.is_active = TRUE) AS total_rooms
FROM hotels h
JOIN cities c ON h.city_id = c.id
WHERE h.is_active = TRUE;


-- Detail booking lengkap (join semua tabel terkait)
CREATE VIEW v_booking_detail AS
SELECT
    b.id,
    b.booking_code,
    g.full_name AS guest_name,
    g.email AS guest_email,
    g.phone AS guest_phone,
    h.name AS hotel_name,
    h.location AS hotel_location,
    r.type_name AS room_type,
    r.size AS room_size,
    r.bed AS room_bed,
    b.check_in,
    b.check_out,
    b.nights,
    b.adults,
    b.children,
    b.room_count,
    r.price AS price_per_night,
    b.subtotal,
    b.tax,
    b.total,
    pm.name AS payment_method,
    bp.status AS payment_status,
    bp.paid_at,
    b.status AS booking_status,
    b.notes,
    b.created_at
FROM bookings b
JOIN guests g ON b.guest_id = g.id
JOIN hotels h ON b.hotel_id = h.id
JOIN rooms r ON b.room_id = r.id
LEFT JOIN booking_payments bp ON b.id = bp.booking_id
LEFT JOIN payment_methods pm ON bp.payment_method_id = pm.id;


-- Statistik booking per hotel (agregasi)
CREATE VIEW v_hotel_stats AS
SELECT
    h.id AS hotel_id,
    h.name AS hotel_name,
    c.name AS city,
    COUNT(b.id) AS total_bookings,
    SUM(CASE WHEN b.status != 'cancelled' THEN b.total ELSE 0 END) AS total_revenue,
    SUM(CASE WHEN b.status = 'cancelled' THEN 1 ELSE 0 END) AS cancelled_count,
    AVG(b.nights) AS avg_stay_nights,
    AVG(b.adults + b.children) AS avg_guests_per_booking
FROM hotels h
JOIN cities c ON h.city_id = c.id
LEFT JOIN bookings b ON h.id = b.hotel_id
GROUP BY h.id, h.name, c.name;