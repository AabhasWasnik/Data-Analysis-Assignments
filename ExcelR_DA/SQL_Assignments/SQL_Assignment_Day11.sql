
# Aabhas Wasnik

# Q1 - 

drop procedure GetCustomerLevel ;
select * from customers;

DELIMITER $$
CREATE PROCEDURE GetCustomerLevel(
    IN pCustomerNumber INT, 
    OUT pCustomerLevel VARCHAR(20))
BEGIN
    DECLARE credit DECIMAL DEFAULT 0;
    SELECT creditLimit 
    INTO credit
    FROM Customers
    WHERE customerNumber = pCustomerNumber;
    IF credit > 100000 THEN
        SET pCustomerLevel = 'PLATINUM';
    ELSEIF credit BETWEEN 25000 AND 100000 THEN
        SET pCustomerLevel = 'GOLD';
    ELSE
        SET pCustomerLevel = 'SILVER';
    END IF;
END$$
DELIMITER ;
CALL GetCustomerLevel(124,@level);
SELECT @level AS "Customer Level";
-- ------------------------------------------
# Q2 -

drop procedure Get_country_payments;
DELIMITER //
CREATE PROCEDURE Get_country_payments(IN inputYear INT, IN inputCountry VARCHAR(255))
BEGIN
    SELECT
        YEAR(p.paymentDate) AS Year,
        c.country AS Country,
        CONCAT(FORMAT(SUM(p.amount)/1000, 0), 'K') AS 'Total Amount'
    FROM Payments p
    JOIN Customers c ON p.customerNumber = c.customerNumber
    WHERE YEAR(p.paymentDate) = inputYear AND c.country = inputCountry
    GROUP BY Year, Country;
END //
DELIMITER ;


CALL Get_country_payments(2003, 'France');
