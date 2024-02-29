
# Aabhas Wasnik

# Q1 - 

SELECT CustomerNumber, CustomerName
FROM Customers
WHERE CustomerNumber NOT IN (SELECT CustomerNumber FROM Orders);

# Q2 -

SELECT C.CustomerNumber, C.CustomerName, IFNULL(COUNT(O.OrderNumber), 0) AS OrderCount
FROM Customers AS C
LEFT JOIN Orders AS O ON C.CustomerNumber = O.CustomerNumber
GROUP BY C.CustomerNumber, C.CustomerName
UNION
SELECT O.CustomerNumber, C.CustomerName, IFNULL(COUNT(O.OrderNumber), 0) AS OrderCount
FROM Customers AS C
RIGHT JOIN Orders AS O ON C.CustomerNumber = O.CustomerNumber
GROUP BY O.CustomerNumber, C.CustomerName;

# Q3 -

SELECT
    OrderNumber,
    MAX(QuantityOrdered) AS quantityOrdered
FROM
    Orderdetails AS od1
WHERE
    QuantityOrdered < (
        SELECT MAX(QuantityOrdered)
        FROM Orderdetails AS od2
        WHERE od1.OrderNumber = od2.OrderNumber
    )
GROUP BY OrderNumber;

# Q4 -

SELECT
    MAX(ProductCount) AS "MAX(Total)",
    MIN(ProductCount) AS "MIN(Total)"
FROM (
    SELECT
        OrderNumber,
        COUNT(*) AS ProductCount
    FROM
        Orderdetails
    GROUP BY
        OrderNumber
) AS Counts;

# Q5(D) -

SELECT p.ProductLine, COUNT(*) AS Total 
FROM Products AS p 
JOIN ( SELECT AVG(BuyPrice) AS AvgBuyPrice 
	   FROM Products ) 
       AS avg_prices 
       ON p.BuyPrice > avg_prices.AvgBuyPrice 
       GROUP BY p.ProductLine 
       ORDER BY Total DESC
    
 -- Cross check each value  by running the individual queries given below   

SELECT * FROM  classicmodels.products p 
WHERE productLine = 'Classic Cars' AND p.buyprice > (select avg(buyprice) from products )

SELECT * FROM  classicmodels.products p 
WHERE productLine = 'Vintage Cars' AND p.buyprice > (select avg(buyprice) from products )

SELECT * FROM  classicmodels.products p 
WHERE productLine = 'Trucks and Buses' AND p.buyprice > (select avg(buyprice) from products )