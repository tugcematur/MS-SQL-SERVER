--use Productdb

--Create View PSales 
--AS
--Select ProductId,SUM(Amount) SalesAmount  from Sales
--WHERE  Code='S'
--GROUP BY ProductId


--Create View PDiscount
--AS
--Select ProductId,SUM(Amount) Discount  from Sales
--WHERE  Code='D'
--GROUP BY ProductId

--Create View PReturn 
--AS
--Select ProductId,SUM(Amount) Ret from Sales
--WHERE  Code='R'
--GROUP BY ProductId

Select * from Psales
Select * from Product
Select * from PDiscount

Select p.ProductId,ProductName,SalesAmount,Discount,ret ,
SalesAmount-Discount-ret Net from Product p 
INNER JOIN PSales s on s.ProductId=p.ProductId
INNER JOIN PReturn r on r.ProductId=p.ProductId
INNER JOIN PDiscount d on d.ProductId=p.ProductId



Select p.ProductId,ProductName,SalesAmount,Discount,ret ,
SalesAmount-Discount-ret Net from Product p 
LEFT JOIN PSales s on s.ProductId=p.ProductId
LEFT JOIN PReturn r on r.ProductId=p.ProductId
LEFT JOIN PDiscount d on d.ProductId=p.ProductId


Select p.ProductId,ProductName,SalesAmount,Discount,ret ,
SalesAmount-Discount-ret Net from Product p 
LEFT JOIN PSales s on s.ProductId=p.ProductId
LEFT JOIN PReturn r on r.ProductId=p.ProductId
LEFT JOIN PDiscount d on d.ProductId=p.ProductId
WHERE SalesAmount is null


--LEFT JOIN işlemi,  iki tablodan ikincideki (sağdakindeki) kayıtlarda hiçbir eşleşen değer olmaması durumunda bile ilk (soldaki) tabloda bulunan tüm kayıtları içerir.
--RIGHT JOIN işlemi, iki tablodan ilkindeki (soldakindeki) kayıtlarda hiçbir eşleşen değer olmaması durumunda bile ikinci (sağdaki) tabloda bulunan tüm kayıtları içerir.

--Örneğin, Departments (sol) ve Employees (sağ) tablolarında, çalışan içermeyenler de dahil olmak üzere tüm departmanları seçmek için LEFT JOIN işlemini kullanabilirsiniz. Bir departmana atanmamış olanlar da dahil olmak üzere tüm çalışanları seçmek için ise RIGHT JOIN kullanırsınız.

--Aşağıdaki örnekte, CategoryID alanındaki Categories ve Products tablolarını birleştirme işlemi gösterilir. Sorgu, hiçbir ürün içermeyenler de dahil olmak üzere tüm kategorilerin bir listesini sağlar:

--SELECT CategoryName, ProductName FROM Categories LEFT JOIN Products ON Categories.CategoryID = Products.CategoryID;
--INNER JOIN deyiminin içinde LEFT JOIN veya RIGHT JOIN bulunabilir, ancak LEFT JOIN veya RIGHT JOIN deyimlerinin içinde INNER JOIN bulunamaz. 

--2.yol


WITH
Urun (UrunId,UrunAd)
AS
(Select ProductId,ProductName from Product),

Satis(UrunId,SatisMiktar)
AS
(Select ProductId, SUM(Amount) from  Sales Where Code='S' GROUP BY  ProductId ),

Iade (UrunId,IadeMiktar)
AS
(Select ProductId, SUM(Amount) from  Sales Where Code='R' GROUP BY  ProductId ),                                

Iskonto (UrunId,IskontoMiktar)
AS
(Select ProductId, SUM(Amount) from  Sales Where Code='D' GROUP BY  ProductId )


select u.UrunId,UrunAd,SatisMiktar,IadeMiktar,IskontoMiktar,(SatisMiktar-IadeMiktar-IskontoMiktar) NetSatis from  Urun u
INNER JOIN Satis s on s.UrunId=u.UrunId 
INNER JOIN Iskonto ıs on ıs.UrunId=u.UrunId
INNER JOIN Iade ıa on ıa.UrunId=u.UrunId                 

--Birlikte execute et hepsini


