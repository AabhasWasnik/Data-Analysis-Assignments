
# Aabhas Wasnik

# Q1 - 

WITH X AS (
SELECT
      YEAR(orderdate) AS YEAR,
      MONTHNAME(orderdate) AS MONTH,
      COUNT(orderdate) as TOTAL_ORDERS
      FROM
      ORDERS
      GROUP BY YEAR,MONTH
)
SELECT 
      YEAR,
      MONTH,
     total_orders AS 'TOTAL_ORDERS',
      CONCAT(
          ROUND(100*(
          (TOTAL_ORDERS-LAG(TOTAL_ORDERS)OVER(ORDER BY YEAR))/LAG(TOTAL_ORDERS)OVER(ORDER BY YEAR)
           ),
           0
           ),
           '%'
           ) AS " % YOY CHANGES"
      FROM 
      X;



-- -----------------------------------------------------------------------------
# Q2 -

DROP TABLE emp_udf ;
CREATE TABLE emp_udf (
    Emp_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    DOB DATE
);
INSERT INTO emp_udf (Name, DOB)
VALUES 
    ("Piyush", "1990-03-30"),
    ("Aman", "1992-08-15"),
    ("Meena", "1998-07-28"),
    ("Ketan", "2000-11-21"),
    ("Sanjay", "1995-05-21");

DROP FUNCTION calculate_age ;    
DELIMITER //

CREATE FUNCTION calculate_age(date_of_birth DATE)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE years INT;
    DECLARE months INT;
    DECLARE age VARCHAR(50);

    SET years = TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE());
    SET months = TIMESTAMPDIFF(MONTH, date_of_birth, CURDATE()) % 12;

    IF years = 0 THEN
        SET age = CONCAT(months, ' months');
    ELSEIF months = 0 THEN
        SET age = CONCAT(years, ' years');
    ELSE
        SET age = CONCAT(years, ' years ', months, ' months');
    END IF;

    RETURN age;
END //

DELIMITER ;

SELECT Emp_ID,Name, DOB, calculate_age(DOB) AS Age FROM emp_udf;
