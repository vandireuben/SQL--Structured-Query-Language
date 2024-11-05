# TO SELECT PREFERED DATABASE
USE Aurora;

#1.	Finds the price of the cheapest product on Products table.
SELECT ProductName,
	(SELECT MIN(Price) 
    FROM products) AS MIN_PRICE
FROM Products 
WHERE Price = (SELECT MIN(Price) FROM products);

#2.	Finds the price of the most expensive product
SELECT ProductName,
	(SELECT MAX(Price) 
    FROM products) AS MIN_PRICE
FROM Products 
WHERE Price = (SELECT MAX(Price) FROM products);

#3.	Finds the number of products in Products table
SELECT COUNT(ProductName)
FROM products;

#4.	Finds the average price of all products
SELECT AVG(Price)
FROM products;

#5.	Finds the sum of the "Quantity" fields in the "orderdetails" table
SELECT SUM(Quantity)
FROM orderdetails;

#6.	Selects all customers that are NOT located in "Germany", "France" and "UK"
SELECT * 
FROM customers
WHERE Country NOT IN ('Germany', 'France', 'UK');

#7.	Selects all customers that are from the same countries as the suppliers
SELECT * 
FROM customers emp1
INNER JOIN suppliers emp2
	ON emp1.CustomerID = emp2.SupplierID
WHERE emp1.Country = emp2.Country;

#8.	Selects all products with a price between 10 and 20 from Products table
SELECT *
FROM products
WHERE Price BETWEEN 10 AND 20;

#9.	Display the products outside the range of the previous.
SELECT *
FROM products
WHERE Price NOT BETWEEN 10 AND 20;

#10.	Selects all products with a price between 10 and 20. In addition; do not show products with a categoryid of 1,2, and 3.
SELECT *
FROM products
WHERE Price BETWEEN 10 AND 20 AND CategoryID NOT IN (1,2,3);

#11.	Selects all orders with an orderdate between '01-July-1996' and '31-July-1996'
-- To query a date column & filter it by YEAR only, you have to include the month and day just like this 1996-01-01 --
SELECT * 
FROM orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

#12.	Creates an alias named "Address" that combine four columns (Address, postalcode, City and Country)
SELECT CustomerID,
	CustomerName,
    CONCAT(Address,', ', 
			Postalcode,', ', 
			City,', ', 
			Country) AS Address
FROM customers;

#13.	Selects all the orders made by customerid = 4 (Around the Horn) from the Customer tabel, and also show the product he bought in products table. We use the "Customers" and "Orders" tables, and give them the table aliases of "c" and "o" respectively.
SELECT *
FROM customers C
INNER JOIN orders O
	ON 	C.CustomerID = O.EmployeeID
INNER JOIN products P
	ON P.ProductID = O.EmployeeID
WHERE C.CustomerID = 3;

#14.	Display all customers, and all orders they had
SELECT *
FROM customers C
INNER JOIN orders O
	ON C.CustomerID = O.EmployeeID;
    
#15.	Match all customers that are from the same city and oder by city
SELECT emp1.CustomerName,
	emp1.Country,
    emp1.City,
	emp2.CustomerName,
	emp2.Country,
    emp2.City
FROM customers emp1
INNER JOIN customers emp2
	ON emp1.CustomerID <> emp2.CustomerID  
WHERE emp1.City = emp2.City
ORDER BY emp1.City, emp2.City;

#16.	Combine "Customers" and "Suppliers" tables as single table and return only the cities (only distinct values) from both tables.
SELECT City 
FROM customers
UNION
SELECT City
FROM suppliers;

#17.	Combine "Customers" and "Suppliers" tables as single table and return only the German cities (only distinct values) from both "Customers" and "Suppliers" tables
SELECT Country,
		City
FROM customers
WHERE Country = 'Germany'
UNION 
SELECT Country,
		City
FROM suppliers
WHERE Country = 'Germany';

#18.	Lists the number of customers in each country, sorted high to low
SELECT COUNT(ContactName),
		Country
FROM customers
GROUP BY Country
ORDER BY COUNT(ContactName) DESC;

#19.	Lists the number of orders sent by each shipper
SELECT COUNT(OrderID) AS Number_of_Orders,
		ShipperName
FROM orders O
INNER JOIN shippers S
	ON O.ShipperID = S.ShipperID
GROUP BY ShipperName
ORDER BY Number_of_Orders DESC;

#20.	Lists the number of customers in each country. Only include countries with more than 5 customers
SELECT COUNT(ContactName) AS Number_of_Customers,
		Country
FROM customers
GROUP BY Country
HAVING Number_of_Customers > 5
ORDER BY Number_of_Customers DESC;

#21.	Lists the employees that have registered more than 10 orders
SELECT COUNT(OrderID),
		LastName
FROM employees E
INNER JOIN orders O
	ON E.EmployeeID = O.EmployeeID
GROUP BY LastName
HAVING COUNT(OrderID) > 10
ORDER BY COUNT(OrderID) DESC;

#22.	Lists if the employees "Janet" or "Nancy" have registered more than 25 orders
SELECT COUNT(OrderID),
		FirstName
FROM employees E
INNER JOIN orders O
	ON E.EmployeeID = O.EmployeeID
WHERE FirstName = 'Janet' OR FirstName = 'Nancy'
GROUP BY FirstName
HAVING COUNT(OrderID) > 25;

#23.	Returns TRUE and lists the suppliers with a product price less than 20
SELECT SupplierName,
		ProductName,
        Price
FROM products P
INNER JOIN suppliers S
	ON P.SupplierID = S.SupplierID
WHERE Price < 20
ORDER BY Price DESC;