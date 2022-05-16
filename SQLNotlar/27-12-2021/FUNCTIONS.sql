use Northwind
use perdb2
use Productdb

select * from Orders                                                                       --Freight:Nakliye ücreti

select MONTH(OrderDate) , SUM(Freight) from Orders group by MONTH(OrderDate)    -- from dan önceki değerile group by dan sonraki aynı olmalı
select OrderDate, DATEADD(DAY,3,OrderDate) from Orders -- 3 gün eklendi


--SQL’de değişken tanımlamaları DECLARE deyimiyle yapılmaktadır. Tanımlanan değişkenlere değer atamak için SET deyimi kullanılır.
--DECLARE @<Değişken_Adı> <Değişken_tipi>


--ORNEK:
--DECLARE @AD VARCHAR(20)
--SET @AD = 'Nancy'
--SELECT * FROM Northwind.dbo.Employees WHERE FirstName = @AD;



--FONKSİYON OLULTURMA
--Programmability->Fuctions->->New->Scalar-valued  Functions

select PersonelId, Ad, Soyad,Maas,dbo.Zam(100,Maas)

from Personel


---------------------------------------------------------------------
--Yaklaşık Varış tarihi Fonksiyonu

--Estimate=Tahmin


Select Id,Duration,Date,dbo.Estimate(Duration,Date) EstimatedDate from Sales

