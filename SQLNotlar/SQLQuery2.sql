
use perdb

-- SELECT

select * from Personel

select Personelid,Ad,Soyad from Personel

select Personelid Id , Ad + ' ' + Soyad FullName, Maas Salary, Izin Vaccation from  Personel

select Personelid Id , Ad + ' ' + Soyad FullName, Maas*1.30 Salary, Izin Vaccation from  Personel

select Personelid Id , Ad + ' ' + Soyad FullName, Maas*1.30 Salary, Izin Vaccation from  Personel  WHERE Izin=0 AND  Maas > 2000

select Personelid Id , Ad + ' ' + Soyad FullName, Maas*1.30 Salary, Izin Vaccation from  Personel  WHERE Izin=0  OR Maas > 2000


select * from Personel WHERE Ulkeid='TR'OR Sehirid= 26

select * from Personel WHERE Ad Not Like 'Tu%'                              

select * from Personel WHERE ad Like '%çe'

select * from Personel WHERE ad Like '%ham%'

select * from Personel WHERE Ulkeid!='TR'

Select Personelid,Ad  name,Soyad surname, Maas*1.15 Salary from Personel 

--1.Yol(TABLOLARI BAĞLAYARAK)

Select  Personelid, Ad, Soyad,EgitimAd,SehirAd,UlkeAd from Personel p,Egitim e,Sehir s,Ulke u WHERE e.Egitimid=p.Egitimid  AND s.Sehirid=p.Sehirid AND u.Ulkeid=P.Ulkeid

--2.Yol (INNER JOİN)

Select Personelid,ad, soyad,SehirAd,UlkeAd,EgitimAd from Personel  p INNER JOIN Sehir s on (s.Sehirid=p.Sehirid) INNER JOIN Ulke u on (u.Ulkeid=p.Ulkeid) 
INNER JOIN Egitim e on(e.Egitimid=p.Egitimid)


Select Personelid,ad, soyad,SehirAd,UlkeAd,EgitimAd from Personel  p JOIN Sehir s on (s.Sehirid=p.Sehirid)  JOIN Ulke u on (u.Ulkeid=p.Ulkeid) 
 JOIN Egitim e on(e.Egitimid=p.Egitimid)   

 --NOT:    INNER JOIN = JOIN 

 --****RIGHT JOIN ve  LEFT JOIN****

 --Şehiri olmayan personeller
 Select Personelid,Ad,Soyad,SehirAd from Personel p LEFT OUTER JOIN Sehir s on(s.Sehirid=p.Sehirid)

 --Kaydı olmayan şehirler
  Select Personelid,Ad,Soyad,SehirAd from Personel p RIGHT OUTER JOIN Sehir s on(s.Sehirid=p.Sehirid)
  --İkisi Birlikte
 Select Personelid,Ad,Soyad,SehirAd from Personel p FULL OUTER JOIN Sehir s on(s.Sehirid=p.Sehirid)


 Select Personelid,Ad,Soyad, ISNULL( SehirAd,'Şehir Kodu Yok') SehirAd from Personel p LEFT OUTER JOIN Sehir s on(s.Sehirid=p.Sehirid)

 Select ISNULL(Personelid,0) Personelid,ISNULL(Ad,'Belirsiz') Ad,ISNULL(Soyad,'Belirsiz') Soyad ,ISNULL(SehirAd,'Belirsiz') SehirAd from Personel p RIGHT OUTER JOIN Sehir s on(s.Sehirid=p.Sehirid)
 
 --NOT
 --LEFT OUTER JOIN = LEFT JOIN   
 --RIGHT OUTER JOIN = RİGHT JOIN
 --FULL OUTER JOIN = FULL JOIN


 Select *from Personel WHERE Ulkeid = 'TR' OR Ulkeid='UK'

  Select *from Personel WHERE Ulkeid in ( 'TR', 'UK','D')

  Select * from Personel WHERE Egitimid in (3)

  Select * from Personel WHERE Egitimid in (Select Egitimid from Egitim WHERE EgitimAd like '%sek%' )

  Select * from Personel p INNER JOIN  Egitim e on (p.Egitimid=e.Egitimid)  WHERE  EgitimAd Not Like '%sek%'

  --BETWEEN AND
  Select * from Personel WHERE Maas BETWEEN 2000 AND 3000
  Select * from Personel WHERE Maas NOT BETWEEN 2000 AND 3000

  Select * from Personel WHERE Ulkeid  BETWEEN 'F'AND 'Z'

  --ORDER BY
  Select * from Personel  ORDER BY Soyad,Ad
  
  Select * from Personel  ORDER BY Soyad ASC
  -- İkincil olarak Personelid e göre 
  --DEFAULT u ASC dir
  Select * from Personel  ORDER BY Soyad DESC, Ad ASC


  Select * from Personel WHERE Maas >2000 ORDER BY Soyad DESC, Ad ASC








  --INSERT
  
  Select * from  Egitim
  Select * from Ulke
  Select * from Personel
  INSERT INTO Egitim(EgitimAd) VALUES ('Doktora')

  INSERT INTO Ulke(UlkeAd,Ulkeid) VALUES ('İspanya','ES') 
  INSERT INTO Ulke(Ulkeid,UlkeAd) VALUES ('A','Avusturya') 
  INSERT INTO Ulke(Ulkeid,UlkeAd) VALUES ('PL','Polonya') 


  INSERT INTO Personel(Ad,Soyad,Maas,Ulkeid,Sehirid,Izin) VALUES ('Ülkü','Demir',4200,'TR',34,0)







  --UPDATE

  Select * from  Egitim
  Select * from Ulke
  Select * from Personel

  Select * from Egitim WHERE Egitimid = 1

  UPDATE Egitim SET EgitimAd = 'Lisans' WHERE Egitimid = 1
  UPDATE Egitim SET EgitimAd = 'Ön Lisans' WHERE Egitimid = 2
  UPDATE Personel SET Ad= 'Öykü', Soyad ='Demirci' , Maas=4100 WHERE Personelid = 8  

  UPDATE Personel SET Ulkeid ='ZAM' WHERE Ulkeid= 'TR'
  UPDATE Personel SET Ulkeid ='TR' WHERE Ulkeid= 'ZAM'



  
  --DELETE

  DELETE from Ulke WHERE Ulkeid= 'F'
  DELETE from Egitim WHERE Egitimid=4

  DELETE from Personel WHERE Personelid =8
  INSERT INTO Personel(Ad,Soyad,Maas,Ulkeid,Sehirid,Izin) VALUES ('Mustafa','Demir',4200,'TR',34,0)
