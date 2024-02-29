
# AABHAS WASNIK 

select * from classicmodels.customers ;
select * from classicmodels.employees 
select * from classicmodels.orders
select * from classicmodels.orderdetails 
select * from classicmodels.products
select * from classicmodels.payments


# Q1 -  	Show employee number, Sales Person (combination of first and last names of employees), 
#           unique customers for each employee number and sort the data by highest to lowest unique customers.
#           Tables: Employees, Customers


SELECT e.employeenumber AS 'Employee Number',
    CONCAT(e.firstname, ' ', e.lastname) AS 'Sales Person',
    COUNT(DISTINCT c.customernumber) AS 'Unique Customers'
FROM Employees e
JOIN Customers c ON e.employeenumber = c.salesrepemployeenumber
GROUP BY e.employeenumber, e.firstname, e.lastname
ORDER BY COUNT(DISTINCT c.customernumber) DESC;

# Q2 -      Show total quantities, total quantities in stock, left over quantities for each product and 
#           each customer. Sort the data by customer number. Tables: Customers, Orders, Orderdetails, Products


SELECT c.customerNumber AS 'Customer Number', c.customerName AS 'customerName',
    p.productCode AS 'Product Code', p.productName AS 'productName',
    SUM(od.quantityOrdered) AS 'Ordered Quantity',
    SUM(p.quantityinStock) AS 'Total inventory',
    SUM(p.quantityinstock - od.quantityordered ) AS 'Left Qty'
FROM Customers c
JOIN Orders o ON c.customernumber = o.customernumber
JOIN Orderdetails od ON o.ordernumber = od.ordernumber
JOIN Products p ON od.productcode = p.productcode
GROUP BY c.customernumber, p.productcode
ORDER BY c.customernumber;

# Q3 -     Create below tables and fields. (You can add the data as per your wish)
#          ● Laptop: (Laptop_Name)  ● Colours: (Colour_Name)
#          Perform cross join between the two tables and find number of rows.
  
DROP TABLE Laptop ;
DROP TABLE Colours ;
CREATE TABLE Laptop (Laptop_Name VARCHAR(50) PRIMARY KEY);
INSERT INTO Laptop (Laptop_Name) VALUES('Dell'),('HP');
CREATE TABLE Colours (Colour_Name VARCHAR(50) PRIMARY KEY);
INSERT INTO Colours (Colour_Name) VALUES('Black'),('Silver'),('White');
SELECT Laptop.Laptop_Name , Colours.Colour_Name
FROM Laptop
CROSS JOIN Colours
ORDER BY Laptop_Name , Colour_Name Desc;

# Q4 -    

DROP TABLE Project ;
CREATE TABLE Project ( EmployeeID INT , FullName VARCHAR(20) , Gender VARCHAR(20) , ManagerID INT );
INSERT INTO Project VALUES(1, 'Pranaya', 'Male', 3);
INSERT INTO Project VALUES(2, 'Priyanka', 'Female', 1);
INSERT INTO Project VALUES(3, 'Preety', 'Female', NULL);
INSERT INTO Project VALUES(4, 'Anurag', 'Male', 1);
INSERT INTO Project VALUES(5, 'Sambit', 'Male', 1);
INSERT INTO Project VALUES(6, 'Rajesh', 'Male', 3);
INSERT INTO Project VALUES(7, 'Hina', 'Female', 3);

SELECT p1.FullName AS "Manager Name", p2.FullName AS "Emp Name" 
FROM Project p1 
JOIN Project p2 ON p1.EmployeeID = p2.ManagerID
ORDER BY 1; 


