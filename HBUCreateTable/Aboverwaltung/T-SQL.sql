use Abo
Go
-- Variablen deklaration
declare @Z1 int, @Firstname varchar(50);
-- set
set @Z1 = 3;

if @Z1 > 3
begin	
	print 'Z1 grösser 3  = ' + cast(@Z1 as varchar); 
end
else
begin print 'Z1 kleiner 3  = ' + cast(@Z1 as varchar); 
end

-- Print
print 'Z1 = ' + cast(@Z1 as varchar); 

-- select auf variable und ausgabe
declare @berner int;

select @berner = COUNT(*) from  Mitglied m
	inner join Ort o on o.ID = m.OrtID
	where o.Ort = 'Bern' 
Print 'Anzahl Berner = ' + cast(@berner as varchar);

---' zwei variablen ausgeben'
declare @vor varchar(20), @nach varchar(20);
select @vor = m.Vorname, @nach = m.Nachname from Mitglied m where m.ID =33
print ' Vorname: ' + @vor + ' Nachname: ' + @nach
--als tabelle ausgben mit select
select @vor as vname, @nach as nname

------------prozedur ----------
select * from Ort;

exec [dbo].[usp_InsertOrt] 8583,Sulgen;


exec dbo.SunScore 2,3,4;

--A2.1
--Erstellen Sie die gespeicherte Prozedur scores, welche die Summe der 5 übergebenen Parameter
--(Datentyp smallint) berechnet und als Output Parameter zurückliefert

/*    ==Skriptparameter==

    Quellserverversion : SQL Server 2016 (13.0.4001)
    Edition des Quelldatenbankmoduls : Microsoft SQL Server Express Edition
    Typ des Quelldatenbankmoduls : Eigenständige SQL Server-Instanz

    Zielserverversion : SQL Server 2017
    Edition des Zieldatenbankmoduls : Microsoft SQL Server Standard Edition
    Typ des Zieldatenbankmoduls : Eigenständige SQL Server-Instanz
*/

USE [Abo]
GO
/****** Object:  StoredProcedure [dbo].[SumScore]    Script Date: 11.03.2018 14:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stefan Keller
-- Create date: 11.03.18
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[SumScore] 
	-- Add the parameters for the stored procedure here
	@sum1 smallint = 0, 
	@sum2 smallint = 0,
	@sum3 smallint = 0,
	@summe smallint OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	set @summe = @sum1 + @sum2 + @sum3;
END

-----------query--------------------------------------------
declare @result smallint
exec dbo.SumScore 3,4,5,@result OUTPUT
select 'Result is: ', @result;
GO
--A2.2
--Verwenden Sie für den obigen scores Prozeduraufruf benannte Parameter in der Form
--Parametername = Wert



declare @result smallint
exec dbo.SumScore @sum2 = 10, @sum1 = 4, @sum3 = 5 , @summe = @result OUTPUT
select 'Result is: ', @result;

--A2.3
--Erstellen Sie nach oben stehendem Vorbild eine gespeicherte Prozedur, welche entweder die
--Summe oder der Mittelwert der übergebenen Parameter berechnet. Ein Parameter bestimmt
--welche Funktion berechnet wird!USE [Abo]
GO
/****** Object:  StoredProcedure [dbo].[SumScore]    Script Date: 11.03.2018 14:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CalcProc] 
	-- Add the parameters for the stored procedure here
	@sum1 smallint = 0, 
	@sum2 smallint = 0,
	@sum3 smallint = 0,
	@average bit = 0,
	@result smallint OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @average = 0 
	begin
	set @result = @sum1 + @sum2 + @sum3
	end
	else
	begin 
	set @result =( @sum1 + @sum2 + @sum3 ) / 3
	end
END

--------------query summe------------
declare @res smallint
exec dbo.CalcProc 2,2,10,0,@res OUTPUT
print @res
GO
-----------query average
declare @res smallint
exec dbo.CalcProc 2,2,10,1,@res OUTPUT
print @res

