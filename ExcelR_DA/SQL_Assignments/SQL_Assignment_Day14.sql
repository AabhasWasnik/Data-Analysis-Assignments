
# Aabhas Wasnik

# Q1 - 

DROP TABLE Emp_EH ;
CREATE TABLE Emp_EH (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(255),
    EmailAddress VARCHAR(255)
);

-- Create the stored procedure for inserting values with exception handling
DROP PROCEDURE InsertEmp_EH ;
DELIMITER //

CREATE PROCEDURE InsertEmp_EH(
    IN p_EmpID INT,
    IN p_EmpName VARCHAR(255),
    IN p_EmailAddress VARCHAR(255)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error occurred';
    END;

    START TRANSACTION;

    -- Insert the values into the Emp_EH table
    INSERT INTO Emp_EH (EmpID, EmpName, EmailAddress)
    VALUES (p_EmpID, p_EmpName, p_EmailAddress);

    COMMIT;
END //

DELIMITER ;

CALL InsertEmp_EH(1, 'John Doe', 'john.doe@example.com');
CALL InsertEmp_EH(2, 'Mike Morgan', 'mike.morgan@example.com');
select * from emp_Eh ;