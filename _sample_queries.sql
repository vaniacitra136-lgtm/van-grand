USE van_grand_suites;

-- ========================================
-- 1. SEMUA HOTEL DENGAN INFO KOTA
-- ========================================
SELECT * FROM v_hotel_summary ORDER BY rating DESC;


-- ========================================
-- 2. CARI HOTEL DI BALI, HARGA MAX 3 JUTA, BINTANG 4+
-- ========================================
CALL sp_search_hotels(2, 3000000, 4, NULL, 'rating');


-- ========================================
-- 3. DETAIL BOOKING BERDASARKAN KODE
-- ========================================
SELECT * FROM v_booking_detail WHERE booking_code = 'VGS-A1B2C3D4';


-- ========================================
-- 4. STATISTIK BOOKING PER HOTEL
-- ========================================
SELECT * FROM v_hotel_stats ORDER BY total_revenue DESC;


-- ========================================
-- 5. BUAT BOOKING BARU
-- ========================================
CALL sp_create_booking(
    1,      -- guest_id
    3,      -- hotel_id (Aston Braga)
    7,      -- room_id (Executive Suite)
    '2025-09-15', -- check_in
    '2025-09-17', -- check_out
    2,      -- adults
    0,      -- children
    1,      -- room_count
    NULL,   -- notes
    1,      -- payment_method (BCA)
    @code,  -- output: booking_code
    @total  -- output: total_amount
);
SELECT @code AS booking_code, @total AS total_amount;


-- ========================================
-- 6. HOTEL DENGAN FASILITAS TERTENTU
-- ========================================
SELECT DISTINCT h.name, h.location, h.rating
FROM hotels h
JOIN hotel_amenities ha ON h.id = ha.hotel_id
JOIN amenities a ON ha.amenity_id = a.id
WHERE a.name IN ('Spa', 'Private Pool')
ORDER BY h.rating DESC;


-- ========================================
-- 7. HOTEL DENGAN TAG TERTENTU
-- ========================================
SELECT DISTINCT h.name, h.price_from
FROM hotels h
JOIN hotel_tags ht ON h.id = ht.hotel_id
JOIN tags t ON ht.tag_id = t.id
WHERE t.name IN ('Free Cancellation', 'Best Seller');


-- ========================================
-- 8. REVENUE PER KOTA
-- ========================================
SELECT
    c.name AS kota,
    SUM(b.total) AS revenue,
    COUNT(b.id) AS jumlah_booking
FROM bookings b
JOIN hotels h ON b.hotel_id = h.id
JOIN cities c ON h.city_id = c.id
WHERE b.status != 'cancelled'
GROUP BY c.name
ORDER BY revenue DESC;


-- ========================================
-- 9. DAFTAR KAMAR TERMURAH SETIAP HOTEL
-- ========================================
SELECT
    h.name AS hotel_name,
    r.type_name,
    r.price,
    r.has_breakfast,
    r.is_cancellable
FROM rooms r
JOIN hotels h ON r.hotel_id = h.id
WHERE r.is_active = TRUE
  AND r.price = (
      SELECT MIN(r2.price)
      FROM rooms r2
      WHERE r2.hotel_id = r.hotel_id AND r2.is_active = TRUE
  )
ORDER BY r.price ASC;


-- ========================================
-- 10. TOP 5 HOTEL PALING BANYAK DI-BOOKING
-- ========================================
SELECT
    h.name,
    c.name AS city,
    COUNT(b.id) AS total_bookings,
    ROUND(AVG(b.nights), 1) AS rata_rata_malam
FROM bookings b
JOIN hotels h ON b.hotel_id = h.id
JOIN cities c ON h.city_id = c.id
WHERE b.status != 'cancelled'
GROUP BY h.id, h.name, c.name
ORDER BY total_bookings DESC
LIMIT 5;


-- ========================================
-- 11. RIWAYAT BOOKING SEORANG TAMU
-- ========================================
SELECT
    b.booking_code,
    h.name AS hotel_name,
    r.type_name AS room_type,
    b.check_in,
    b.check_out,
    b.nights,
    b.total,
    b.status
FROM bookings b
JOIN hotels h ON b.hotel_id = h.id
JOIN rooms r ON b.room_id = r.id
WHERE b.guest_id = 1
ORDER BY b.created_at DESC;


-- ========================================
-- 12. HOTEL YANG BELUM PERNAH DI-BOOKING
-- ========================================
SELECT h.name, h.location, h.price_from
FROM hotels h
WHERE h.id NOT IN (SELECT DISTINCT hotel_id FROM bookings)
  AND h.is_active = TRUE;


-- ========================================
-- 13. DISTRIBUSI METODE PEMBAYARAN
-- ========================================
SELECT
    pm.name AS metode,
    pm.category AS kategori,
    COUNT(bp.id) AS jumlah,
    SUM(bp.amount) AS total_nominal
FROM booking_payments bp
JOIN payment_methods pm ON bp.payment_method_id = pm.id
WHERE bp.status = 'paid'
GROUP BY pm.id, pm.name, pm.category
ORDER BY jumlah DESC;


-- ========================================
-- 14. BOOKING DIBATALKAN DAN ALASAN POTENSIAL
-- ========================================
SELECT
    b.booking_code,
    h.name AS hotel_name,
    g.full_name,
    b.total,
    b.notes,
    b.created_at,
    DATEDIFF(b.check_in, b.created_at) AS hari_sebelum_checkin
FROM bookings b
JOIN hotels h ON b.hotel_id = h.id
JOIN guests g ON b.guest_id = g.id
WHERE b.status = 'cancelled'
ORDER BY b.created_at DESC;