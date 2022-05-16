create view ProductList as 
Select p.Id,ProductName,
CompanyName,CategoryName
from Products p
join Categories c on (c.Id = p.CategoryId)
join Suppliers s on (s.Id = p.SupplierId)

Select *from ProductList


