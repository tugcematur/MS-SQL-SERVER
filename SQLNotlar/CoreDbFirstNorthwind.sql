
select ProductID, ProductName,
CompanyName, CategoryName, UnitPrice
from Products p
inner join Suppliers s on (p.SupplierID = s.SupplierID) inner join  Categories c on (c.CategoryID = p.CategoryID)