show databases

use classicmodels ;
show tables ;

SELECT * FROM classicmodels.customers ;

SELECT * FROM classicmodels.employees ;

SELECT * FROM classicmodels.offices ;

SELECT * FROM classicmodels.orderdetails ;

SELECT * FROM classicmodels.orders ;

SELECT * FROM classicmodels.payments ;

SELECT * FROM classicmodels.productlines ;

SELECT * FROM classicmodels.products ;

set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY','')

SET sql_mode = '';
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));