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

exec [dbo].[usp_InsertOrt](8583,Sulgen);


