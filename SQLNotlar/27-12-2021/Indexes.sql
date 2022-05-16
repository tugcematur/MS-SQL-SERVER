use perdb2


--INDEX

--Tables->Indexes->new index-> Nonm-clustred index ->index name değiştir-> Add -> Ad ı seçtik index olarak
--Birden fazla non-clustred index oluşturulabilir.



select Ad,Soyad  from Personel order by Ad

select * from Personel where Ad like'%var%'