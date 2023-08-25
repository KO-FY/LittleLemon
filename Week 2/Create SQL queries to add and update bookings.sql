USE littlelemondb;

-- Task 1
DELIMITER //
CREATE PROCEDURE AddBooking(
    IN in_booking_id INT,
    IN in_customer_id INT,
    IN in_booking_date DATE,
    IN in_table_number INT
)
BEGIN
    INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID)
    VALUES (in_booking_id, in_booking_date, in_table_number, in_customer_id);
END //
DELIMITER ;


-- Task 2
DELIMITER //
CREATE PROCEDURE UpdateBooking(
    IN in_booking_id INT,
    IN in_booking_date DATE
)
BEGIN
    UPDATE Bookings
    SET Date = in_booking_date
    WHERE BookingID = in_booking_id;
END //
DELIMITER ;

-- Task 3

DELIMITER //
CREATE PROCEDURE CancelBooking(
    IN in_booking_id INT
)
BEGIN
    DELETE FROM Bookings
    WHERE BookingID = in_booking_id;
END //
DELIMITER ;

