
# AABHAS WASNIK 

# Q1 -   	Show customer number, customer name, state and credit limit from customers table for below conditions. 
#           Sort the results by highest to lowest values of creditLimit.
#           ●	State should not contain null values
#           ●	credit limit should be between 50000 and 100000

# -------------------------------------------------------------------------------------------------------------------

use classicmodels ;

SELECT customerNumber, customerName, state, creditLimit
FROM customers
WHERE state IS NOT NULL
  AND creditLimit BETWEEN 50000 AND 100000
ORDER BY creditLimit DESC;

# Q2 -       2)	Show the unique productline values containing the word cars at the end from products table.

SELECT DISTINCT productLine
FROM products
WHERE productLine LIKE '%cars';

