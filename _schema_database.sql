CREATE DATABASE IF NOT EXISTS van_grand_suites;
USE van_grand_suites;

-- Hapus semua tabel jika ada (urutan sesuai foreign key dependency)
DROP TABLE IF EXISTS booking_payments;
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS hotel_tags;
DROP TABLE IF EXISTS hotel_amenities;
DROP TABLE IF EXISTS hotel_images;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS amenities;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS hotels;
DROP TABLE IF EXISTS payment_methods;
DROP TABLE IF EXISTS guests;
DROP TABLE IF EXISTS cities;