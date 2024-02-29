
# AABHAS WASNIK 

# Q1(D) -   	For every year, find the minimum amount value from payments table.


select year(paymentDate) as year ,min(amount) as min_amount from payments
group by year
order by year

#Q2 - 2)	For every year and every quarter, find the unique customers and 
#           total orders from orders table. Make sure to show the quarter as Q1,Q2 etc .
 
 SELECT YEAR(orderDate) AS orderYear,
 CONCAT('Q', QUARTER(orderDate)) AS quarter,
 COUNT(DISTINCT customerNumber) AS uniqueCustomers,
 COUNT(orderNumber) AS totalOrders
 FROM orders
 GROUP BY orderYear,
 quarter ORDER BY orderYear,
 quarter;

#Q3 - 

-- SELECT * FROM CLASSICMODELS.PAYMENTS

SELECT MONTHNAME(paymentdate) AS payment_month,
       CONCAT(FORMAT(SUM(amount) / 1000, 0), 'K') AS formatted_amount
FROM payments
GROUP BY payment_month
HAVING SUM(amount) BETWEEN 500000 AND 1000000
ORDER BY SUM(amount) DESC;
