
# AABHAS WASNIK 

# Q1 -   	Create a journey table with following fields and constraints.

#●	Bus_ID (No null values)
#●	Bus_Name (No null values)
#●	Source_Station (No null values)
#●	Destination (No null values)
#●	Email (must not contain any duplicates)

DROP TABLE Journey ;
CREATE TABLE Journey (
    Bus_ID INT PRIMARY KEY NOT NULL,
    Bus_Name VARCHAR(100) NOT NULL,
    Source_Station VARCHAR(100) NOT NULL,
    Destination VARCHAR(255) NOT NULL,
    Email VARCHAR(100) UNIQUE
);
SELECT * FROM CLASSICMODELS.Journey

#2)	Create vendor table with following fields and constraints.

# ●	Vendor_ID (Should not contain any duplicates and should not be null)
#●	Name (No null values)
#●	Email (must not contain any duplicates)
#●	Country (If no data is available then it should be shown as “N/A”)

DROP TABLE Vendor ;
CREATE TABLE Vendor (
    Vendor_ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Country VARCHAR(255) DEFAULT 'N/A'
);
SELECT * FROM CLASSICMODELS.Vendor

#3)	Create movies table with following fields and constraints.

#●	Movie_ID (Should not contain any duplicates and should not be null)
#●	Name (No null values)
#●	Release_Year (If no data is available then it should be shown as “-”)
#●	Cast (No null values)
#●	Gender (Either Male/Female)
#●	No_of_shows (Must be a positive number)

DROP TABLE Movies ;
CREATE TABLE Movies (
    Movie_ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Release_Year VARCHAR(4) DEFAULT '-',
    Cast VARCHAR(255) NOT NULL,
    Gender ENUM('Male', 'Female') NOT NULL,
    No_of_shows INT CHECK (No_of_shows >= 0) NOT NULL
);
SELECT * FROM CLASSICMODELS.Movies

# 4)	Create the following tables. Use auto increment wherever applicable

# a. Product
# ✔	product_id - primary key
# ✔	product_name - cannot be null and only unique values are allowed
# ✔	description
# ✔	supplier_id - foreign key of supplier table

# b. Suppliers
# ✔	supplier_id - primary key
# ✔	supplier_name
# ✔	location

# c. Stock
# ✔	id - primary key
# ✔	product_id - foreign key of product table
# ✔	balance_stock

DROP TABLE Suppliers ;
DROP TABLE Product ;
DROP TABLE Stock ;
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(255) NOT NULL,
    location VARCHAR(255)
);
CREATE TABLE Product (
    product_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);
CREATE TABLE Stock (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    balance_stock INT,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
describe Product ;
select * from classicmodels.Stock