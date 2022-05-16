-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER Ekle
ON Musteri                          --Hangi tablo üzerinde işlem yapıldığı
   AFTER INSERT
AS 


BEGIN
declare @YKKN int
declare @MusteriId int 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here

	Select @MusteriId = MusteriId, @YKKN= KKK from inserted

	INSERT INTO LogTable  (MusteriId,YKKN,Tarih,Gorevli,Islem)
	VALUES (@MusteriId,@YKKN,GETDATE(),CURRENT_USER, 'Yeni Müşteri Kaydı')

END
GO
