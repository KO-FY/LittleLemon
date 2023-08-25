SHOW DATABASES;
USE littlelemondb;

-- Task 1 

DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    DECLARE max_quantity INT;
    
    SELECT MAX(Quantity) INTO max_quantity
    FROM Orders;
    
    SELECT max_quantity AS MaxOrderedQuantity;
END //
DELIMITER ;

CALL GetMaxQuantity();

-- Task 2
DELIMITER //
CREATE PROCEDURE GetOrderDetail(IN in_customer_id INT)
BEGIN
    SET @sql_query = CONCAT('SELECT OrderID, Quantity, TotalCost FROM Orders WHERE CustomerID = ?', in_customer_id);
    PREPARE stmt FROM @sql_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

-- Task 3
DELIMITER //
CREATE PROCEDURE CancelOrder(IN in_order_id INT)
BEGIN
    DELETE FROM Orders
    WHERE OrderID = in_order_id;
END //
DELIMITER ;
