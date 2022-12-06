USE report;

#Q1
SELECT SUM(Quantity * unitprice) as total 
FROM sale_table;

#Q2
SELECT COUNT(DISTINCT customer) 
FROM sale_table;

#Q3
SELECT Product, SUM(Quantity) FROM sale_table 
GROUP BY Product ORDER BY Product ASC;

#Q4
ALTER TABLE sale_table ADD T_price INT;
SET SQL_SAFE_UPDATES = 0;
UPDATE sale_table SET T_price = Quantity * unitprice WHERE T_price IS NULL;
SELECT Customer, SUM(T_price), SUM(Quantity), COUNT(Customer) FROM sale_table WHERE T_price >1500 GROUP BY Customer ORDER BY Customer ASC;

#Q5
SELECT SUM(Totalquantity*profitratio) /100 , SUM(totalprice*profitratio)/100 FROM
(SELECT ST.product  ,SUM(ST.quantity) AS Totalquantity, SUM(ST.T_price) AS totalprice , SP.profitratio FROM sale_table AS ST INNER JOIN sale_profit AS SP ON ST.product = SP.product GROUP BY product) AS Profittable;

#Q6
SELECT SUM(C_NUMBER) FROM(
SELECT COUNT(DISTINCT CUSTOMER) AS C_NUMBER , DATE  FROM sale_table GROUP BY DATE) AS C_BUY;




