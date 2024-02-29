
# Aabhas Wasnik

# Q1 -
DROP TABLE Emp_BIT ;
CREATE TABLE Emp_BIT (
    Name VARCHAR(255),
    Occupation VARCHAR(255),
    Working_date DATE,
    Working_hours INT
);

-- Insert data into the Emp_BIT table
INSERT INTO Emp_BIT VALUES
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);

-- Create a before-insert trigger
DELIMITER //
CREATE TRIGGER EnsurePositiveWorkingHours
BEFORE INSERT ON Emp_BIT
FOR EACH ROW
BEGIN
    IF NEW.Working_hours < 0 THEN
        SET NEW.Working_hours = -NEW.Working_hours;
    END IF;
END //
DELIMITER ;

-- Inserting data with a negative Working_hours value
INSERT INTO Emp_BIT VALUES ('John', 'Tester', '2020-10-04', -8);

-- Querying the table to verify the inserted data
SELECT * FROM Emp_BIT;
