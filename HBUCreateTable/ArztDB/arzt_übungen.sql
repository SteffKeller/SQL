use ArztDB
Go


select * from Arzt
--Aufgaben: Views / Stored Procedures
--A1.4
--Erstellen Sie eine View welche alle Patienten mit Diagnose 'ANGINA' inkl. der Arzt-Namen listet.
drop view viewAngina;
create view viewAngina as 
select p.PatientName,d.DiagnoseName, a.ArztName from Patient p
inner join Konsultation k on p.PatientNr = k.PatientNr
inner join Arzt a on a.ArztNr = k.ArztNr
inner join Diagnose d on d.DiagnoseNr = k.DiagnoseNr
where d.DiagnoseName = 'Angina';

select * from viewAngina

--A2.4
--Erstellen Sie eine Stored Procedures die die Anzahl Konsultationen einer bestimmten Diagnose
--ermittelt

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	2
-- =============================================
CREATE PROCEDURE uebung24 
	-- Add the parameters for the stored procedure here
	@diag varchar(50) = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT COUNT(*) from Konsultation k
	inner join Diagnose d on k.DiagnoseNr = d.DiagnoseNr
	where d.DiagnoseName = @diag;
END
GO

Exec uebung24 'Angina';

----2.4.1
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	2
-- =============================================
CREATE PROCEDURE uebung241
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT COUNT(*) , d.DiagnoseName from Konsultation k
	inner join Diagnose d on k.DiagnoseNr = d.DiagnoseNr
	group by d.DiagnoseName ;
	
END
GO

exec uebung241;


--A2.5
--Erstellen Sie eine Stored Procedure welche alle Ärzte listet

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	2
-- =============================================
CREATE PROCEDURE uebung25

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT a.ArztName, o.PLZ, o.Ort  from Arzt a
	inner join Ort o  on a.OrtNr = o.OrtNr; 
END

exec uebung25;

--A2.6
--Erstellen Sie eine Stored Procedures die eine neue Ortschaft (PLZ, Ort) einfügt.SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		uebung26
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE addOrt 
	-- Add the parameters for the stored procedure here
	@plz int = 0, 
	@ort varchar(50) = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Ort (PLZ,Ort)
	values( @plz, @ort)
	SELECT SCOPE_IDENTITY();
END
GO

exec addOrt 3456, 'Sulgen';


--Aufgaben: TSQL Functions / Cursors
--Erstellen Sie die Skalarfunktion ufnFirstName() welche ein kommagetrenntes Argument mit
--Vorname und Nachname und als zweites Argument ein Flag = First | Last erwartet. Wird die
--Funktion mit Flag = First aufgerufen dann soll der Vorname, bei Flag = Last der
--Nachname zurückgeliefert geliefert werden.

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		
-- Create date: 
-- Description:	uebung11
-- =============================================
CREATE FUNCTION uebung11 
(
	-- Add the parameters for the function here
	@names varchar(50),
	@flag varchar(50)
)
RETURNS varchar(50)
AS
BEGIN
	DECLARE @Result varchar(50);
	DECLARE @name  varchar(50) = ' ';
	DECLARE @index int;
		-- Declare the return variable here
	Set @index = CHARINDEX((','),@names,0)

	if (@flag like ('%First%'))
		begin
		 Set @name = SUBSTRING(@names,0,@index);
		end
	else
		begin
		Set @name = SUBSTRING(@names,@index,LEN(@names));
		end
	

	return @name

END
GO

declare @ret varchar(50);
select dbo.uebung11(('Max,Müller'),('Last'));

--A1.3
--Erstellen Sie die Funktion ufnGetNumOfDaySinceLastConsultation () welche eine
--ArztNr erwartet und die Anzahl Tage seit der letzten ausgeführten Konsultation ermittelt. Falls der
--Arzt noch keine Konsultationen getätigt hat, soll -1 zurückgeliefert werden.
--Tipp: Verwenden Sie die Systemfunktionen: DATEDIFF() und GETDATE()
--Beispiel Aufruf:
--select ArztName, dbo.ufnGetNumOfDaySinceLastConsultation(ArztNr) from Arzt;SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		
-- Create date: 
-- Description:	uebung13
-- =============================================
CREATE FUNCTION uebung13 
(
	-- Add the parameters for the function here
	@arztid int
)
RETURNS int
AS
BEGIN

	declare @numdays int = 0;

	if exists (select k.ArztNr from Konsultation k where k.ArztNr = @arztid)
	begin
		select @numdays = DATEDIFF(day,max(k.Datum), getdate()) from Konsultation k where k.ArztNr = @arztid;
	end
	else
	begin 
	set @numdays = -1;
	end

	-- Return the result of the function
	RETURN @numdays;

END
GO

select Arzt.ArztName, dbo.uebung13(Arzt.ArztNr) from Arzt;

--A1.4
--Erstellen Sie die Tabellenwertfunktion ufnConsultationsOfPatient(), welche alle
--Konsultationen eines Patienten als Tabelle zurückgibt.
--Beispiel Aufruf: select * from dbo.ufnConsultationsOfPatient(1234);SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION uebung14 
(
	-- Add the parameters for the function here
	@patientid int
)
RETURNS table
AS 
return
	(

	select * from Konsultation where Konsultation.PatientNr = @patientid
)
GO

select * from dbo.uebung14(4711);--A2.1
--Erstellen Sie die Skalarfunktion ufnGetListOfDiagnoses(), welche sämtliche Namen der
--Diagnosen in einer kommagetrennten Zeichenkette zurückliefert. Ermitteln Sie in der Funktion die
--Namen der Diagnosen mittels einer satzweisen Verarbeitung in einer Schleife(Cursor).
--Beispiel Aufruf: select dbo.ufnGetListOfDiagnoses();

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		
-- Create date: 
-- Description:	
-- =============================================
--drop function ufnGetListOfDiagnoses
create FUNCTION ufnGetListOfDiagnoses ()
RETURNS varchar(2000)
AS
BEGIN
	-- Declare the return variable here
	declare @diagname varchar(20);
	declare @diaglist varchar(2000) = '';
	DECLARE @Result varchar(100);
	declare diag cursor for select d.DiagnoseName from Diagnose d
	order by d.DiagnoseName

	open diag
	fetch next from diag into @diagname;
	while @@FETCH_STATUS = 0
	begin
		if @diaglist <> ''
		 set @diaglist = @diaglist + ',';

		 set @diaglist = @diaglist + @diagname;
		 fetch next from diag into @diagname;
		 end
		 close diag;
		 deallocate diag;
	return @diaglist;
end;

select [dbo].[ufnGetListOfDiagnoses]();




	-- Add the T-SQL statements to compute the return value here


END
GO
