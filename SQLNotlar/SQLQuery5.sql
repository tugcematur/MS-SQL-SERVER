use Northwind

select * from Categories
select * from Products
select * from Customers
select * from Suppliers
select * from Employees

select emp.EmployeeID,emp.LastName, emp.FirstName,emp.Country,emp.Title,emp.ReportsTo ,mng.FirstName+ ' ' + mng.LastName
from Employees emp
INNER JOIN Employees mng on mng.EmployeeID= emp.ReportsTo 

select emp.EmployeeID,emp.LastName, emp.FirstName,emp.Country,emp.Title,emp.ReportsTo ,mng.FirstName+ ' ' + mng.LastName
from Employees emp
LEFT JOIN Employees mng on mng.EmployeeID= emp.ReportsTo 

Select ProductID,ProductName,UnitPrice,CategoryName from Products p
INNER JOIN  Suppliers s on s.SupplierID =p.SupplierID  
INNER JOIN Categories c on c.CategoryID= p.CategoryID

--VİEW (Sanal Tablo)

Create view empMan 
AS
select e.EmployeeID, e.FirstName + ' ' + e.Lastname Employee  ,e.Title,e.TitleOfCourtesy,m.FirstName + ' ' + m.LastName Manager  from Employees e
INNER JOIN Employees m on  e.ReportsTo =m.EmployeeID  WHERE e.TitleOfCourtesy = 'Mr.'


Select * from empMan    

--Create view empWomen 
--AS
--select e.EmployeeID, e.FirstName + ' ' + e.Lastname Employee  ,e.Title,e.TitleOfCourtesy,m.FirstName + ' ' + m.LastName Manager,   from Employees e
--INNER JOIN Employees m on  e.ReportsTo =m.EmployeeID  WHERE e.TitleOfCourtesy in('Mrs.','Ms.')


Select * from empWomen  -- Edit->Intallisense-> Refresh 

--DROP VIEW
DROP VIEW empWomen


select *from Orders
Select *from Customers
select * from Employees

--create view satis
--AS
--Select o.OrderID,
--CompanyName,
--ProductName,FirstName+' '+ LastName Employee,
--o.OrderDate,
--od.UnitPrice,od.Quantity,
--od.Quantity*od.UnitPrice Amount
--from Orders o
--INNER JOIN Customers c on c.CustomerID=o.CustomerID 
--INNER JOIN [Order Details] od on od.OrderID = o.OrderID
--INNER JOIN Products p on p.ProductID = od.ProductID
--INNER JOIN Employees e on e.EmployeeID= o.EmployeeID


--Aggregate Functions(Kümeleme Fonksiyonları)
--ORDER BY ile view oluşturulmaz!!!

select *from satis

select COUNT(*)  [Satır Sayısı] from satis

select ProductName, SUM(Amount) Toplam,COUNT(*) [Toplam Satır], AVG(Amount) Ortalama  from satis GROUP BY ProductName

select Employee, SUM(Amount) Toplam,COUNT(*) [Toplam Satır], AVG(Amount) Ortalama  from satis GROUP BY Employee

select ProductName , Employee,SUM(Amount) Toplam,COUNT(*) [Toplam Satır], AVG(Amount) Ortalama  from satis GROUP BY ProductName,Employee

select ProductName , Employee,MONTH(OrderDate) ay,SUM(Amount) Toplam,COUNT(*) [Toplam Satır], AVG(Amount) Ortalama  from satis GROUP BY ProductName,Employee,MONTH(OrderDate)
having ProductName like ('%lice%')