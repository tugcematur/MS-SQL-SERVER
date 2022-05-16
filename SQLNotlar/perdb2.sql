use perdb2
--View layabiliriz kolaylık açısındna, Btür tablolar DTO dur
select p.PersonelId, p.Ad + '' + p.Soyad AdSoy,p.Maas, UnvanAd Unvan,u.UlkeAd Ikamet, uy.UlkeAd Uyruk,  ISNULL(m.Ad + '' + m.Soyad ,'Başkan') Yonetici from Personel p inner join Ulke u on (u.UlkeId = p.UlkeId)inner join Ulke uy on (uy.UlkeId = p.UyrukId)left outer join Personel m on ( m.PersonelId=p.YoneticiId )inner join Unvan un on(un.UnvanId = p.UnvanId)    --Aynı tablodaki PersonelId ve YoneticiId



select * from Personel

select YoneticiId from Personel GROUP BY YoneticiId

select * from Personel where UnvanId >=3

select UyrukId from Personel p inner join Ulke u on(p.UlkeId = u.UlkeId ) inner join Ulke uy on (uy.UlkeId = p.UyrukId) group by UyrukId



