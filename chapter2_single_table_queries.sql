USE TSQL2012;

-- THE TOP AND OFFSET-FETCH FILTERS --

SELECT TOP (5) 
	orderid, 
	orderdate, 
	custid, 
	empid
FROM Sales.Orders
ORDER BY orderdate DESC;


SELECT TOP (5) WITH TIES orderid, orderdate, custid, empid
FROM Sales.Orders
ORDER BY orderdate DESC;


SELECT
	orderid,
	orderdate,
	custid,
	empid
FROM  Sales.Orders
ORDER BY orderdate DESC
OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY;


SELECT 
	orderid,
	custid,
	val,
	ROW_NUMBER() OVER(PARTITION BY custid ORDER BY val) AS rownum
FROM Sales.OrderValues
ORDER BY custid, val;


-- PREDICATES AND OPERATORS --

SELECT
	orderid,
	empid,
	orderdate
FROM Sales.Orders
WHERE orderid IN(10248, 10249,10250);


SELECT 
	orderid,
	empid,
	orderdate
FROM Sales.Orders
WHERE orderid BETWEEN 10300 AND 10310;


SELECT
	empid,
	firstname,
	lastname
FROM HR.Employees
WHERE lastname LIKE N'D%';


SELECT
	orderid,
	empid,
	orderdate
FROM Sales.Orders
WHERE orderdate >= '20080101';


SELECT
	orderid,
	empid,
	orderdate
FROM Sales.Orders
WHERE orderdate >= '20080101'
	AND empid IN (1, 3, 5);


-- Combining multipe predicates
SELECT
	orderid,
	custid,
	orderdate
FROM Sales.Orders
WHERE
	(custid = 1 AND empid IN (1, 3, 5))
	OR
	(custid = 85 AND empid IN (2, 4, 6));


-- CASE EXPRESSIONS --
