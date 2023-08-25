SHOW DATABASES;
USE littlelemondb;

-- Task 1
CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, TotalCost
FROM Orders
WHERE Quantity > 2;


-- Task 2
SELECT
    cd.CustomerID,
    cd.CustomerName,
    o.OrderID,
    o.TotalCost,
    m.Cuisine ,
    m.Courses,
    m.Starters 
FROM
    CustomerDetails cd
JOIN
    Bookings b ON cd.CustomerID = b.CustomerID
JOIN
    Orders o ON b.BookingID = o.BookingID
JOIN
    LittleLemonDB.Menu m ON o.MenuID = m.MenuID
WHERE
    o.TotalCost > 150
ORDER BY
    o.TotalCost ASC;
 
--  Task 3
SELECT cuisine
FROM Menu
WHERE MenuID = ANY (
    SELECT MenuID
    FROM Orders
    WHERE Quantity > 2
);
