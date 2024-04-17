USE classicmodels;
-- Getting the details of the how many rows are in all the tables--

SELECT COUNT(*) Total_Customer FROM CUSTOMERS; -- 122 Rows are present in customers table --
SELECT COUNT(*) Total_Employees FROM EMPLOYEES; -- 23 Rows are present in employees table --
SELECT COUNT(*) Total_Offices FROM OFFICES; -- 7 Rows are present in offices table --
SELECT COUNT(*) Order_Details FROM ORDERDETAILS; -- 2996 Rows are present in Order Details table --
SELECT COUNT(*) Total_Orders FROM ORDERS; -- 326 Rows are present in Orders table --
SELECT COUNT(*) Total_Payments FROM PAYMENTS; -- 273 Rows are present in Payments table --
SELECT COUNT(*) Total_Productlines FROM PRODUCTLINES; -- 07 Rows are present in Product Lines table --
SELECT COUNT(*) Total_Products FROM PRODUCTS; -- 10 Rows are present in Products table --

-- [Cleaning the customer table] --

SELECT * FROM CUSTOMERS;
-- Checking for Duplicates in customer table --
SELECT CUSTOMERNUMBER, COUNT(CUSTOMERNUMBER) AS NO_OF_COUNT FROM CUSTOMERS GROUP BY CUSTOMERNUMBER HAVING COUNT(CUSTOMERNUMBER) > 1; -- We got no duplicate customers --
-- Dropping address line 2 column as it contains many null values and no use of the column -- 
ALTER TABLE CUSTOMERS DROP COLUMN ADDRESSLINE2;
-- Dropping Postalcode column as it contains many null values, does have proper value and no use of the column too -- 
ALTER TABLE CUSTOMERS DROP COLUMN POSTALCODE;
-- Dropping the customer name table as it does contain actual name of the customers rather it contains some other names -- 
ALTER TABLE CUSTOMERS DROP COLUMN CUSTOMERNAME;
-- Dropping the phone column from customers as it has no purpose for the analysis --
ALTER TABLE CUSTOMERS DROP COLUMN PHONE;
-- Renaming the column names in customers

ALTER TABLE CUSTOMERS RENAME COLUMN CONTACTLASTNAME TO customerlastname;
ALTER TABLE CUSTOMERS RENAME COLUMN CONTACTFIRSTNAME TO customerfirstname;
-- Deleting values from customer where creditLimit is zero --
DELETE FROM CUSTOMERS WHERE CREDITLIMIT = 0.00;
-- Checking for total null values present in State column
SELECT COUNT(*) FROM CUSTOMERS WHERE STATE IS NULL;
-- As The column contains null values more than half of the total values present in the customer table, We can remove the column as it will affect our analysis --
ALTER TABLE CUSTOMERS DROP COLUMN STATE;
-- Now customer table is clean and ready for further analysis -- 


-- [Cleaning the Employees table] --

SELECT * FROM EMPLOYEES;
-- Dropping unwanted columns from Employees table
ALTER TABLE EMPLOYEES DROP COLUMN EXTENSION; -- This column doesnt indicate any useful information --
ALTER TABLE EMPLOYEES DROP COLUMN EMAIL; -- Email column doesnt required for the analysis --
-- Now Employees table is clean and ready for further analysis -- 


-- [Cleaning the Offices table] --

SELECT * FROM OFFICES;
-- Droping all the unnecessary columns from offices table
ALTER TABLE OFFICES DROP COLUMN PHONE; 
ALTER TABLE OFFICES DROP COLUMN ADDRESSLINE1;
ALTER TABLE OFFICES DROP COLUMN ADDRESSLINE2;
ALTER TABLE OFFICES DROP COLUMN POSTALCODE;
ALTER TABLE OFFICES DROP COLUMN STATE;
-- Now Offices table is clean and ready for further analysis -- 

-- [Cleaning the Order details table] --

SELECT * FROM ORDERDETAILS;
-- The Order Line Number is not connected with any of the tables --
ALTER TABLE ORDERDETAILS DROP COLUMN ORDERLINENUMBER;
-- Now Order details table is clean and ready for further analysis -- 

-- [Cleaning the Order details table] --

SELECT * FROM ORDERS;
-- Droping the unnecessary columns from offices table
ALTER TABLE ORDERS DROP COLUMN COMMENTS;
-- Now Orders table is clean and ready for further analysis --  

-- [Cleaning the Payments table] --

SELECT * FROM PAYMENTS;
-- Dropping Check Number Column as it is not necessary for analysis --
ALTER TABLE PAYMENTS DROP COLUMN CHECKNUMBER;
-- Now Payments table is clean and ready for further analysis -

-- [Cleaning the Product lines table] --

SELECT * FROM PRODUCTLINES;
-- Droping the unnecessary columns from offices table -- 
ALTER TABLE PRODUCTLINES DROP COLUMN HTMLDESCRIPTION;
ALTER TABLE PRODUCTLINES DROP COLUMN IMAGE;
-- Now Product lines table is clean and ready for further analysis -

-- [Cleaning the Products table] --

SELECT * FROM PRODUCTS;
-- Droping the unnecessary columns from offices table -- 
ALTER TABLE PRODUCTS DROP COLUMN PRODUCTDESCRIPTION;
-- Now Products table is clean and ready for further analysis -

/* AS I HAVE DONE ALL THE NECESSARY CLEANING OF THE DATA, NOW I CAN DO ALL THE ANALYSIS TO GET THE IMPORTANT INFORMATION THAT WILL BE HELPFUL FOR SALES TEAM */

-- Total Sales Or Revenue-- 
SELECT SUM(QUANTITYORDERED * PRICEEACH) AS TOTAL_SALES FROM ORDERDETAILS;

-- Total Profit -- 
SELECT  SUM((QUANTITYORDERED * PRICEEACH) - (BUYPRICE * QUANTITYORDERED)) as PROFIT FROM PRODUCTS
JOIN ORDERDETAILS ON PRODUCTS.PRODUCTCODE = ORDERDETAILS.PRODUCTCODE;

-- Total Orders	--
SELECT SUM(QUANTITYORDERED) AS TOTAL_ORDERS FROM ORDERDETAILS;

-- Monthly Orders -- 
SELECT DATE_FORMAT(ORDERDATE, '%Y-%m') AS YEARMONTH, SUM(QUANTITYORDERED) AS TOTAL_ORDERS
FROM ORDERDETAILS
JOIN ORDERS ON ORDERS.ORDERNUMBER = ORDERDETAILS.ORDERNUMBER
GROUP BY YEARMONTH
ORDER BY YEARMONTH;

-- Total Cancelled or In Process or On Hold Orders --
SELECT STATUS, COUNT(*) AS ORDERS
FROM ORDERS
WHERE STATUS= 'IN PROCESS' OR STATUS = 'ON HOLD' OR STATUS = 'CANCELLED'
GROUP BY STATUS;

-- Maximum Orders by Sales Representative --
SELECT CONCAT(FIRSTNAME, ' ', LASTNAME) AS EMPLOYEE_FULL_NAME, SUM(QUANTITYORDERED) AS TOTAL_ORDERS FROM EMPLOYEES
JOIN CUSTOMERS ON CUSTOMERS.SALESREPEMPLOYEENUMBER = EMPLOYEES.EMPLOYEENUMBER
JOIN ORDERS ON CUSTOMERS.CUSTOMERNUMBER = ORDERS.CUSTOMERNUMBER
JOIN ORDERDETAILS ON ORDERS.ORDERNUMBER = ORDERDETAILS.ORDERNUMBER
GROUP BY EMPLOYEE_FULL_NAME
ORDER BY TOTAL_ORDERS DESC;

-- Monthly Sales -- 
SELECT DATE_FORMAT(ORDERDATE, '%Y-%m') AS YEARMONTH, SUM(QUANTITYORDERED * PRICEEACH) AS MONTHLY_SALES
FROM ORDERS
JOIN ORDERDETAILS ON ORDERS.ORDERNUMBER = ORDERDETAILS.ORDERNUMBER
GROUP BY YEARMONTH
ORDER BY YEARMONTH;

-- Average Monthly Sales --
SELECT DATE_FORMAT(ORDERDATE, '%Y-%m') AS YEARMONTH, ROUND(AVG(QUANTITYORDERED * PRICEEACH)) AS AVERAGE_MONTHLY_SALES
FROM ORDERS
JOIN ORDERDETAILS ON ORDERS.ORDERNUMBER = ORDERDETAILS.ORDERNUMBER
GROUP BY YEARMONTH
ORDER BY YEARMONTH;

-- Total Sales by Country --
SELECT COUNTRY, SUM(QUANTITYORDERED * PRICEEACH) AS TOTAL_SALES
FROM CUSTOMERS
JOIN ORDERS ON CUSTOMERS.CUSTOMERNUMBER = ORDERS.CUSTOMERNUMBER
JOIN ORDERDETAILS ON ORDERS.ORDERNUMBER = ORDERDETAILS.ORDERNUMBER
GROUP BY COUNTRY
ORDER BY TOTAL_SALES DESC;

-- Total Sales Contribution by Product Vendor --
SELECT PRODUCTVENDOR, SUM(QUANTITYORDERED * PRICEEACH) AS TOTAL_SALES
FROM PRODUCTS
JOIN ORDERDETAILS ON PRODUCTS.PRODUCTCODE = ORDERDETAILS.PRODUCTCODE
GROUP BY PRODUCTVENDOR
ORDER BY TOTAL_SALES DESC; 	

-- Total Sales by Product Category(Product lines) --
SELECT PRODUCTLINE, SUM(QUANTITYORDERED * PRICEEACH) AS TOTAL_SALES
FROM PRODUCTS
JOIN ORDERDETAILS ON PRODUCTS.PRODUCTCODE = ORDERDETAILS.PRODUCTCODE
GROUP BY PRODUCTLINE
ORDER BY TOTAL_SALES DESC;

-- Total Sales by Products --
SELECT PRODUCTNAME, SUM(QUANTITYORDERED * PRICEEACH) AS TOTAL_SALES
FROM PRODUCTS
JOIN ORDERDETAILS ON PRODUCTS.PRODUCTCODE = ORDERDETAILS.PRODUCTCODE
GROUP BY PRODUCTNAME
ORDER BY TOTAL_SALES DESC;

-- Most Profitable Customers --
SELECT CONCAT(CUSTOMERFIRSTNAME, ' ', CUSTOMERLASTNAME) AS CUSTOMER_NAME, SUM(QUANTITYORDERED * PRICEEACH) AS TOTAL_SALES
FROM CUSTOMERS
JOIN ORDERS ON CUSTOMERS.CUSTOMERNUMBER = ORDERS.CUSTOMERNUMBER
JOIN ORDERDETAILS ON ORDERS.ORDERNUMBER = ORDERDETAILS.ORDERNUMBER
GROUP BY CUSTOMER_NAME
ORDER BY TOTAL_SALES DESC
LIMIT 10;