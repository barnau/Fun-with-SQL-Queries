-- 1. Write a query to return all category names with their descriptions from the Categories table.

SELECT CategoryName, Description FROM dbo.Categories

-- 2. Write a query to return the contact name, customer id, company name and city name of all Customers in London

SELECT ContactName, CustomerID, CompanyName, City FROM dbo.Customers

-- 3. Write a query to return all available columns in the Suppliers tables for the marketing managers and sales representatives that have a FAX number

SELECT * FROM dbo.Suppliers WHERE Phone != 'NULL' AND ContactTitle = 'Marketing Manager' OR ContactTitle = 'Sales Representative'

--4. Write a query to return a list of customer id's from the Orders table with required dates between Jan 1, 1997 and Dec 31, 1997 and with freight under 100 units.

SELECT * FROM dbo.Orders WHERE RequiredDate between '1997-01-01' and '1997-12-31'

-- 5. Write a query to return a list of company names and contact names of all customers from Mexico, Sweden and Germany.

SELECT CompanyName, ContactName FROM Customers WHERE Country = 'Mexico' OR Country = 'Sweden' OR Country = 'Germany'

--6. Write a query to return a count of the number of discontinued products in the Products table.

SELECT COUNT(Discontinued) FROM Products Where Discontinued = 1

--7. Write a query to return a list of category names and descriptions of all categories beginning with 'Co' from the Categories table.

SELECT CategoryName, Description 
FROM Categories
WHERE CategoryName LIKE 'Co%'

--8. Write a query to return all the company names, city, country and postal code from the Suppliers table with the word 'rue' in their address. The list should ordered alphabetically by company name.

Select CompanyName, City, Country, PostalCode 
FROM Suppliers 
WHERE Address LIKE '%rue%'
ORDER BY CompanyName ASC

-- 9. Write a query to return the product id and the quantity ordered for each product labelled as 'Quantity Purchased' in the Order Details table ordered by the Quantity Purchased in descending order.

Select ProductID, Quantity 
from [Order Details] 
Order By Quantity desc

--10. Write a query to return the company name, address, city, postal code and country of all customers with orders 
--that shipped using Speedy Express, along with the date that the order was made.
SELECT ShipAddress, ShipCity, ShipPostalCode, ShipCountry, CompanyName  FROM Orders
INNER JOIN Customers On Orders.CustomerID=Customers.CustomerID
WHERE ShipVia = '1'

--11. Write a query to return a list of Suppliers containing company name, contact name, contact title and region description.



-- 12. Write a query to return all product names from the Products table that are condiments.

SELECT ProductName FROM Products WHERE CategoryID = '2'

-- 13. Write a query to return a list of customer names who have no orders in the Orders table.
Select ContactName from customers 
Left Join Orders  ON Orders.CustomerID = Customers.CustomerID 
WHERE Orders.CustomerID is NULL

--14. Write a query to add a shipper named 'Amazon' to the Shippers table using SQL.
Insert into Shippers (CompanyName, Phone)
values ('Amazon', '(555) 555-8439');

--15. Write a query to change the company name from 'Amazon' to 'Amazon Prime Shipping' in the Shippers table using SQL.

Update Shippers
Set CompanyName='Amazon Prime Shipping'
Where CompanyName='Amazon'

--16. Write a query to return a complete list of company names from the Shippers table. Include freight totals rounded to the nearest whole
--number for each shipper from the Orders table for those shippers with orders.

Select Shippers.CompanyName, SUM(Round(Freight, 0)) as TotalOfOrders 
from Shippers
Left JOIN Orders 
on shippers.ShipperID = Orders.ShipVia 
Group By CompanyName

-- 17. Write a query to return all employee first and last names from the Employees table by combining the 2 columns aliased as 'DisplayName'. The combined format should be 'LastName, FirstName'.

select LastName+', '+FirstName As DisplayName from Employees

-- 18. Write a query to add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread'.

insert into Customers(CustomerID, ContactName, CompanyName)
Values ('barn', 'Blaine Arnau', 'OCA');

insert into Orders (CustomerID, ShipName)
Values('barn', 'Grandmas Boysenberry Spread');

--19. Write a query to remove yourself and your order from the database.

Delete from Orders where CustomerID = 'barn'
Delete from Customers where CustomerID = 'barn'

--20. Write a query to return a list of products from the Products table along with the total units in stock for each product. 
--Include only products with TotalUnits greater than 100.
Select ProductName, UnitsInStock + UnitsOnOrder As TotalUnits
from Products 
where UnitsInStock > 100