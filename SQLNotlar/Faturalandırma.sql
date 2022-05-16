use Faturadb

select * from FatDetay
select * from FatMaster

--select fd.FaturaNo,MusteriAd,IlceAd+'/'+ SehirAd [İlçe/Şehir],Adres,VDNo,KatAd,UrunAd,Miktar,fd.BFiyat,fd.BFiyat*Miktar Tutar,Fm.Tarih  from FatDetay fd 
--INNER JOIN  FatMaster fm on fd.FaturaNo=fm.FaturaNo
--INNER JOIN  Urun u on u.UrunId = fd.UrunId
--INNER JOIN Musteri m on m.MusteriId=fm.MusteriId
--INNER JOIN Ilce i on i.IlceId=m.IlceId
--INNER JOIN Sehir s on s.SehirId=i.SehirId
--INNER JOIN Kategori k on k.KatId=u.KatId
--INNER JOIN Birim b on b.BirimId=u.BirimId

--NOT Kolon sadece bir tabloda varsa kısaltmayla çağrılmasına gerek yok!!!!!!!!!!!!!!!!!!!!!!!!!!!!

Create View FaturaListe
AS
select fd.FaturaNo,MusteriAd,IlceAd+'/'+ SehirAd [İlçe/Şehir],Adres,VDNo,KatAd,UrunAd,Miktar,fd.BFiyat,fd.BFiyat*Miktar Tutar,Fm.Tarih  from FatDetay fd 
INNER JOIN  FatMaster fm on fd.FaturaNo=fm.FaturaNo
INNER JOIN  Urun u on u.UrunId = fd.UrunId
INNER JOIN Musteri m on m.MusteriId=fm.MusteriId
INNER JOIN Ilce i on i.IlceId=m.IlceId
INNER JOIN Sehir s on s.SehirId=i.SehirId
INNER JOIN Kategori k on k.KatId=u.KatId
INNER JOIN Birim b on b.BirimId=u.BirimId


Select * from FaturaListe