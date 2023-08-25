USE littlelemondb;

-- Task 1 

INSERT INTO CustomerDetails (CustomerID, CustomerName, ContactDetails)
VALUES
    (1, 'John Doe', 'john@me.com'),
    (2, 'Jane Smith', 'jane@me.com'),
    (3, 'Michael Johnson', 'michael@okay.com'),
    (4, 'Emily Williams', 'emily@okay.com');
 
INSERT INTO Bookings (BookingID, Date, TableNumber, CustomerID)
VALUES
    (1, '2022-10-10', 5, 1),
    (2, '2022-11-12', 3, 3),
    (3, '2022-10-11', 2, 2),
    (4, '2022-10-13', 2, 1);
    
-- Task 2
DELIMITER //
CREATE PROCEDURE CheckBooking(IN in_booking_date DATE, IN in_table_number INT)
BEGIN
    DECLARE booking_status INT;

    SELECT COUNT(*) INTO booking_status
    FROM Bookings
    WHERE Date = in_booking_date AND TableNumber = in_table_number;

    IF booking_status > 0 THEN
        SELECT 'Table is already booked on the provided date.' AS Status;
    ELSE
        SELECT 'Table is available for booking on the provided date.' AS Status;
    END IF;
END //
DELIMITER ;


-- Task 3
DELIMITER //
CREATE PROCEDURE AddValidBooking(IN in_booking_date DATE, IN in_table_number INT, IN in_customer_id INT)
BEGIN
    DECLARE booking_count INT;
    
    -- Start a transaction
    START TRANSACTION;

    -- Check if the table is already booked on the provided date
    SELECT COUNT(*) INTO booking_count
    FROM Bookings
    WHERE Date = in_booking_date AND TableNumber = in_table_number;
    
    -- If the table is already booked, rollback the transaction
    IF booking_count > 0 THEN
        ROLLBACK;
        SELECT 'Table is already booked on the provided date.' AS Status;
    ELSE
        -- If the table is available, insert the new booking and commit the transaction
        INSERT INTO Bookings (Date, TableNumber, CustomerID)
        VALUES (in_booking_date, in_table_number, in_customer_id);
        
        COMMIT;
        SELECT 'Booking added successfully.' AS Status;
    END IF;
    
END //
DELIMITER ;
 