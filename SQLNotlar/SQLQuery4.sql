
use perdb2
--Unicode karakterler daha çok yer kaplayacağı için  nchar() veya nvarchar() 
--Unicode karakterleri kabul etmez char ve varchar


select * from Personel
--1.Yol

select PersonelId, Ad,Soyad, p.UnvanId,
UnvanAd,p.UlkeId,UlkeAd,UyrukId
from Personel p, Unvan u,Ulke ul WHERE p.UnvanId = u.UnvanId AND
p.UlkeId = ul.UlkeId AND
p.UyrukId = ul.UlkeId

select PersonelId, Ad,Soyad, p.UnvanId,
UnvanAd,p.UlkeId,uik.UlkeAd ikamet,UyrukId,uluy.UlkeAd uyruk
from Personel p, Unvan u,Ulke uik,Ulke uluy  WHERE p.UnvanId = u.UnvanId AND
p.UlkeId = uik.UlkeId AND
p.UyrukId = uluy.UlkeId

--2.Yol
Select c.PersonelId, c.Ad +' '+ c.Soyad Personel ,c.Maas,UnvanAd, u1.UlkeAd İkamet,u2.UlkeAd Uyruk,y.Ad + ' ' + y.Soyad Yönetici from Personel c
INNER JOIN Unvan u on (c.UnvanId= u.UnvanId)
INNER JOIN Ulke u1 on (u1.UlkeId=c.UlkeId)
INNER JOIN Ulke u2 on (u2.UlkeId = c.UyrukId)
INNER JOIN Personel y on(y.PersonelId = c.YoneticiId)

Select c.PersonelId, c.Ad + c.Soyad Personel , c.Maas ,UnvanAd, u1.UlkeAd İkamet,u2.UlkeAd Uyruk, ISNULL( y.Ad + ' ' + y.Soyad, 'YOK') Yönetici from Personel c
INNER JOIN Unvan u on c.UnvanId= u.UnvanId
INNER JOIN Ulke u1 on u1.UlkeId=c.UlkeId
INNER JOIN Ulke u2 on u2.UlkeId = c.UyrukId
LEFT JOIN Personel y on y.PersonelId = c.YoneticiId


select PersonelId, Ad, Soyad,UnvanAd from Personel p LEFT JOIN Unvan u on p.UnvanId = u.UnvanId
select PersonelId, Ad, Soyad,UnvanAd from Personel p RIGHT JOIN Unvan u on p.UnvanId = u.UnvanId
select  PersonelId,ISNULL(Ad,'Belirsiz') Ad,ISNULL(Soyad,'Belirsiz') Soyad,ISNULL(UnvanAd,'Belirsiz')UnvanAd from Personel p FULL JOIN Unvan u on p.UnvanId = u.UnvanId


                                                                                                                      