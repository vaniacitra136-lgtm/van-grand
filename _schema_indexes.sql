CREATE INDEX idx_hotels_city   ON hotels(city_id);
CREATE INDEX idx_hotels_stars  ON hotels(stars);
CREATE INDEX idx_hotels_rating ON hotels(rating);
CREATE INDEX idx_hotels_price  ON hotels(price_from);

-- Rooms
CREATE INDEX idx_rooms_hotel   ON rooms(hotel_id);
CREATE INDEX idx_rooms_price   ON rooms(price);

-- Bookings
CREATE INDEX idx_bookings_guest  ON bookings(guest_id);
CREATE INDEX idx_bookings_hotel  ON bookings(hotel_id);
CREATE INDEX idx_bookings_dates  ON bookings(check_in, check_out);
CREATE INDEX idx_bookings_status ON bookings(status);
CREATE INDEX idx_bookings_code   ON bookings(booking_code);

-- Payments
CREATE INDEX idx_payments_booking ON booking_payments(booking_id);
CREATE INDEX idx_payments_status  ON booking_payments(status);

-- Images
CREATE INDEX idx_images_hotel ON hotel_images(hotel_id, sort_order);