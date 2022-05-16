Select fm.FaturaNo, Tarih,MusteriAd,UrunAd,fd.BFiyat,Adet,Adet*fd.BFiyat Tutar from FatMaster fm
inner join  FatDetay fd on (fm.FaturaNo = fd.FaturaNo) 
inner join Musteri m  on(fm.MusteriId = m.MusteriId)
inner join Urun u on (fd.UrunId = u.UrunId)