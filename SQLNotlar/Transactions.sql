use perdb2
SET IMPLICIT_TRANSACTIONS ON
BEGIN TRAN
select * from Unvan 
INSERT INTO Unvan(UnvanAd)
VALUES ('ccc')
UPDATE  Unvan SET UnvanAd='Kıdemsiz' WHERE UnvanId =6
DELETE from Unvan where UnvanId=30

Commit Tran
Rollback Tran 